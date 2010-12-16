module Xeroizer
  module Record
    
    class CreditNoteClass < BaseClass
        
      set_permissions :read, :write, :update
      
    end
    
    class CreditNote < Base
      
      CREDIT_NOTE_STATUS = {
        'AUTHORISED' =>       'Approved credit_notes awaiting payment',
        'DELETED' =>          'Draft credit_notes that are deleted',
        'DRAFT' =>            'CreditNotes saved as draft or entered via API',
        'PAID' =>             'CreditNotes approved and fully paid',
        'SUBMITTED' =>        'CreditNotes entered by an employee awaiting approval',
        'VOID' =>             'Approved credit_notes that are voided'
      } unless defined?(CREDIT_NOTE_STATUS)
      
      CREDIT_NOTE_TYPE = {
        'ACCRECCREDIT' =>           'Accounts Receivable',
        'ACCPAYCREDIT' =>           'Accounts Payable'
      } unless defined?(CREDIT_NOTE_TYPE)
      
      string    :credit_note_id, :api_name => 'CreditNoteID'
      string    :credit_note_number
      string    :reference
      string    :type
      date      :date
      string    :status
      string    :line_amount_types
      decimal   :sub_total
      decimal   :total_tax
      decimal   :total
      datetime  :updated_date_utc, :api_name => 'UpdatedDateUTC'
      string    :currency_code
      datetime  :fully_paid_on_date
      
      belongs_to  :contact
      has_many    :line_items
      
    end
    
  end
end