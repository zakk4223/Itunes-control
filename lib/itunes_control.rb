require 'daap'
require 'net/http'


class ItunesControl
  
  attr_accessor :host
  attr_accessor :port
  attr_accessor :session_id
  attr_accessor :content_codes  

  def initialize(remote_host, remote_port = 3689)
    @host = remote_host
    @port = remote_port
    @session_id = nil
    @login_done = nil
    @content_codes = {}
    #grab the content codes
    content_codes_result = contentcodes
    if content_codes_result and content_codes_result['mccr'] and content_codes_result['mccr']['mdcl']
      all_codes = content_codes_result['mccr']['mdcl']
      all_codes.each do |ccode|
        @content_codes[ccode['mcnm']] = {:typecode => ccode['mcty'], :name => ccode['mcna']}
      end
    end
      
  end
  

  #returns true on success/false on failure
  
  #also sets the session id instance variable for the object  
  def login(pair_guid)
    login_result = make_itunes_request("/login", {'pairing-guid' => pair_guid})
    puts login_result.inspect
    @session_id = login_result['dmap.loginresponse']['mlid'] if login_result['dmap.loginresponse']
    @login_done = true
    return @session_id    
  end
  
  
  def playstatus(revision_number=1)
    play_status = make_itunes_request("/ctrl-int/1/playstatusupdate", {'revision_number' => 1})
  end
  
  def playpause
    command_result = make_itunes_request("/ctrl-int/1/playpause")
  end
  
  def nextitem
    command_result = make_itunes_request("/ctrl-int/1/nextitem")
  end  

  def contentcodes
    command_result = make_itunes_request("/content-codes")
  end
      
  def previtem
    command_result = make_itunes_request("/ctrl-int/1/previtem")
  end
  
  def playlists(database_id)
    ask_for_meta = ['dmap.persistentid', #mper 
      'com.apple.itunes.special-playlist', #aePS
      'com.apple.itunes.smart-playlist', #aeSP
      'dmap.itemname', #minm
      'dmap.itemcount', #mimc
      'dmap.itemid', #miid
      'daap.baseplaylist', #apbl
      'com.apple.itunes.saved-genius', #???
      'dmap.parentcontainerid', #mpco
      'dmap.editcommandssupported', #meds (values unknown)
      'com.apple.itunes.jukebox-current', #???
      'daap.songcontentdescription' #ascn 
      ]
    command_result = make_itunes_request("/databases/#{database_id}/containers", {'meta' => ask_for_meta.join(',')})
    return [] unless command_result['aply'] and command_result['aply']['mlcl'] and command_result['aply']['mlcl']['mlit']
    command_result['aply']['mlcl']['mlit'].collect do |ply|
      a = {'id' => ply['miid'], 
        'persistent_id' => ply['mper'], 
        'name' => ply['minm'], 
        'count' => ply['mimc']
        }
        a['base_playlist'] = ply['apbl'] if ply['apbl'] 
        a['special_playlist'] = ply['aePS'] if ply['aePS']
        a['smart_playlist'] = ply['aeSP'] if ply['aeSP']
        a['parent'] = ply['mpco'] if ply['mpco']
        a['edit_supported'] = ply['meds'] if ply['meds']
        a['description'] = ply['ascn'] if ply['ascn']
        a
    end
  end
  
  def current_revision
    command_result = make_itunes_request("/update", {'revision-number' => 1})
    return 1 unless command_result['mupd']
    return command_result['mupd']['musr']
  end
  
  def nowplayingartwork(width = 320, height = 320)
    command_result = make_itunes_request('/ctrl-int/1/nowplayingartwork', {'mw' => width, 'mh' => height})
  end
  
  
  def databases
    command_result = make_itunes_request("/databases")
    return [] unless command_result['avdb'] and command_result['avdb']['mlcl'] and command_result['avdb']['mlcl']['mlit']
    command_result['avdb']['mlcl']['mlit'].collect do |idb|
      {'id' => idb['miid'], 'persistent_id' => idb['mper'], 'name' => idb['minm'], 'count' => idb['mimc']}
    end
  end
  
  
  private
  def check_session_id
    #TODO: throw exception here?
    return @session_id
  end
  
  

  def make_itunes_request(request_path, params = {}, extra_headers={})
    #return nil unless check_session_id
    
    params['session-id'] ||= @session_id
    param_string = params.collect {|k,v| "#{k}=#{v}"}.join('&')
    request_string = request_path
    request_string += "?" + param_string unless param_string.empty?
    request_result = Net::HTTP.start(@host,@port) do |http|
      http.get(request_string, extra_headers.merge({'User-Agent' => 'Remote/1.3.3', 'Viewer-Only-Client' => '1'}))
    end
    
    #some commands have no return values, like pause/skip etc.
    if request_result.body
      retval = DAAP::Protocol::Tag.parse(request_result.body, @content_codes)
      print retval.inspect
      return retval
    else
      return true
    end
  end
  
end