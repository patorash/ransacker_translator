require 'nkf'

module RansackerTranslator
  extend ActiveSupport::Concern

  class_methods do
    def ransacker_translate(*columns)
      columns.each do |column|
        ransacker :"#{column}_translate", formatter: proc {|v| NKF.nkf('-w -XZ0', v.mb_chars) } do |parent|
          single_byte_char = '-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz !#$%&¥;:'
          double_byte_char = '－０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ　！＃＄％＆￥；：'
          Arel::Nodes::NamedFunction.new("UPPER",
                                         [Arel::Nodes::NamedFunction.new("TRANSLATE",
                                                                         [parent.table[column],
                                                                          double_byte_char,
                                                                          single_byte_char].map { |it| Arel::Nodes.build_quoted(it) })
          ])
        end
      end
    end
  end
end