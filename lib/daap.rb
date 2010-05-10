module DAAP
  module Protocol
    
    
    
    DATATYPES = {
      1 => 'c',
      3 => 'n',
      5 => 'N',
      7 => 'N',
      12 => nil
    }
    
    
    TYPECODES = {
      'abal' => 12,
      'abar' => 12,
      'abcp' => 12,
      'abgn' => 12,
      'abpl' => 1,
      'abro' => 12,
      'adbs' => 12,
      'aeAI' => 5,
      'aeCI' => 5,
      'aeCR' => 9,
      'aeEN' => 9,
      'aeES' => 5,
      'aeFP' => 1,
      'aeGD' => 5,
      'aeGE' => 5,
      'aeGH' => 5,
      'aeGI' => 5,
      'aeGR' => 7,
      'aeGU' => 7,
      'aeHD' => 1,
      'aeHV' => 1,
      'aeMK' => 1,
      'aeNN' => 9,
      'aeNV' => 5,
      'aePC' => 1,
      'aePI' => 5,
      'aePP' => 1,
      'aePS' => 1,
      'aeSF' => 5,
      'aeSG' => 1,
      'aeSI' => 5,
      'aeSN' => 9,
      'aeSP' => 1,
      'aeSU' => 5,
      'aeSV' => 11,
      'agrp' => 9,
      'aply' => 12,
      'aprm' => 1,
      'apro' => 11,
      'apsm' => 1,
      'apso' => 12,
      'arif' => 12,
      'arsv' => 12,
      'asaa' => 9,
      'asai' => 7,
      'asal' => 9,
      'asar' => 9,
      'asbk' => 1,
      'asbo' => 5,
      'asbr' => 3,
      'asbt' => 3,
      'ascd' => 5,
      'ascm' => 9,
      'ascn' => 9,
      'asco' => 1,
      'ascp' => 9,
      'ascr' => 1,
      'ascs' => 5,
      'asct' => 9,
      'asda' => 10,
      'asdb' => 1,
      'asdc' => 3,
      'asdk' => 1,
      'asdm' => 10,
      'asdn' => 3,
      'asdp' => 10,
      'asdr' => 10,
      'asdt' => 9,
      'ased' => 3,
      'aseq' => 9,
      'asfm' => 9,
      'asgn' => 9,
      'asgp' => 1,
      'ashp' => 1,
      'asky' => 9,
      'aslc' => 9,
      'asls' => 7,
      'aspu' => 9,
      'asrv' => 2,
      'assa' => 9,
      'assc' => 9,
      'assl' => 9,
      'assn' => 9,
      'assp' => 5,
      'assr' => 5,
      'asss' => 9,
      'asst' => 5,
      'assu' => 9,
      'assz' => 5,
      'astc' => 3,
      'astm' => 5,
      'astn' => 3,
      'asul' => 9,
      'asur' => 1,
      'asyr' => 3,
      'ated' => 3,
      'avdb' => 12,
      'caar' => 5,
      'caas' => 5,
      'caia' => 1,
      'cana' => 9,
      'cang' => 1,
      'canl' => 9,
      'cann' => 9,
      'canp' => 9,
      'cant' => 5,
      'caps' => 1,
      'carp' => 1,
      'cash' => 1,
      'cass' => 1,
      'cast' => 5,
      'casu' => 1,
      'cavc' => 1,
      'ceSG' => 1,
      'cmik' => 1,
      'cmmk' => 5,
      'cmnm' => 9,
      'cmpa' => 12,
      'cmsp' => 1,
      'cmsr' => 5,
      'cmst' => 12,
      'cmsv' => 1,
      'cmty' => 9,
      'cmvo' => 5,
      "f\215ch" => 1,
      'mbcl' => 12,
      'mccr' => 12,
      'mcna' => 9,
      'mcnm' => 9,
      'mcon' => 12,
      'mctc' => 5,
      'mcti' => 5,
      'mcty' => 3,
      'mdcl' => 12,
      'meds' => 5,
      'miid' => 5,
      'mikd' => 1,
      'mimc' => 5,
      'minm' => 9,
      'mlcl' => 12,
      'mlid' => 5,
      'mlit' => 12,
      'mlog' => 12,
      'mpco' => 5,
      'mper' => 7,
      'mpro' => 11,
      'mrco' => 5,
      'msal' => 1,
      'msas' => 1,
      'msau' => 1,
      'msbr' => 1,
      'msdc' => 5,
      'msed' => 1,
      'msex' => 1,
      'mshc' => 3,
      'mshi' => 5,
      'mshl' => 12,
      'mshn' => 5,
      'msix' => 1,
      'mslr' => 1,
      'mspi' => 1,
      'msqy' => 1,
      'msrs' => 1,
      'msrv' => 12,
      'mstc' => 10,
      'mstm' => 5,
      'msto' => 6,
      'msts' => 9,
      'mstt' => 5,
      'msup' => 1,
      'mtco' => 5,
      'mudl' => 12,
      'mupd' => 12,
      'musr' => 5,
      'muty' => 1
    }
    
    
    
    TAGTYPES = {
       'mstt' => :int,
       'mslr' => :byte,
       'mstm' => :int,
       'msal' => :byte,
       'msup' => :byte,
       'mspi' => :byte,
       'msex' => :byte,
       'msbr' => :byte,
       'msqy' => :byte,
       'msix' => :byte,
       'msrs' => :byte,
       'msdc' => :int,
       'mcty' => :short,
       'mlid' => :int,
       'musr' => :int,
       'muty' => :byte,
       'mtco' => :int,
       'mrco' => :int,
       'miid' => :int,
       'mper' => :long,
       'mimc' => :int,
       'mctc' => :int,
       'mikd' => :byte,
       'asdk' => :byte,
       'msbr' => :byte,
       'astm' => :int,
       'astn' => :short,
       'aeFP' => :byte
       
    }
      
      


    class Tag
      
      attr_accessor :name
      attr_accessor :length
      attr_accessor :data
 
 
      
      def self.parse(data_blob='', content_code_map = {})
        return nil if data_blob.length < 8
        data_hash = {}
        data_offset = 0  
        while data_blob.length > data_offset
          tag_name = data_blob[data_offset,4]
          data_length = data_blob[data_offset+4,4].unpack('N').first
          data_raw = data_blob[data_offset+8,data_length]
          data_value = data_raw
          
          content_code_map ||= {} #in case we passed nil in by accident
          tag_map = content_code_map[tag_name] || {}
          tag_type = tag_map[:typecode] || DAAP::Protocol::TYPECODES[tag_name]            
          if DAAP::Protocol::DATATYPES[tag_type]
            data_value = data_raw.unpack(DAAP::Protocol::DATATYPES[tag_type]).first
          elsif tag_type == 12
            data_value = parse(data_raw)
          end
          tag_name = tag_map[:name] if tag_map and tag_map[:name]
          
          if data_hash[tag_name] 
            unless data_hash[tag_name].is_a? Array
              data_hash[tag_name] = [data_hash[tag_name]]
            end
            data_hash[tag_name] << data_value
          elsif tag_name == 'mlit' #mlit is always a list
            data_hash[tag_name] = [data_value]
          else
            data_hash[tag_name] = data_value
          end
          data_offset += (8 + data_length)
        end
        return data_hash
      end


      def initialize(tagname, tagdata='')
        self.name = tagname.to_s
        self.length = 0
        self.data = ''
        if tagdata
          
          #hack because ruby's pack('Q') is stupid
          puts "TAG NAME IS #{self.name}"
          if self.name == 'mper'
            self.data = [tagdata].pack('Q').reverse
          elsif self.name == 'msma'
            self.data = [tagdata].pack('Q').reverse
          elsif self.name == 'asai'
            self.data = [tagdata].pack('Q').reverse
          elsif self.name == 'cmpg'
            self.data = [tagdata].pack('Q').reverse
          elsif DAAP::Protocol::DATATYPES[DAAP::Protocol::TYPECODES[self.name]]
            self.data = [tagdata].pack(DAAP::Protocol::DATATYPES[DAAP::Protocol::TYPECODES[self.name]])
          else
            self.data = tagdata
          end
          self.length = self.data.to_s.length
        end
      end
             
      def to_s
        ret = ''
        ret << self.name
        ret << [self.data.length].pack('N')
        ret << self.data.to_s
        ret
      end
      
 
      
      
      def method_missing(tagname, *args, &block)
        if block
          new_tag = Tag.new(tagname, args.first)
          block.call(new_tag)
          self.data << new_tag.to_s
        else
          new_tag = Tag.new(tagname, args.first)
          self.data << new_tag.to_s
        end        
      end
    end
  end
end
