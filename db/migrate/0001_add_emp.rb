Sequel.migration do
  change do
    create_table :emp do
      primary_key :EMP_ROWID, :type => 'Integer', :auto_increment => true
      String      :EMP_STOREID
      Date        :EMP_DATE
      String      :EMP_PAYTYPE
      String      :EMP_FIRST_NAME
      String      :EMP_LAST_NAME
      String      :EMP_MI
      String      :EMP_ID
      BigDecimal  :EMP_RATE1, :size=>[9,4]
      BigDecimal  :EMP_RATE2, :size=>[9,4]
      BigDecimal  :EMP_RATE3, :size=>[9,4]
      BigDecimal  :EMP_RATE4, :size=>[9,4]
      BigDecimal  :EMP_RATE5, :size=>[9,4]
      Date        :EMP_HIRED
    end
  end
end
