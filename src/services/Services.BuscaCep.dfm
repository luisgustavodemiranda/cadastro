inherited DMBuscaCep: TDMBuscaCep
  OldCreateOrder = True
  Height = 167
  Width = 259
  inherited cdsCadastro: TClientDataSet
    Left = 176
    Top = 80
  end
  object RESTClient: TRESTClient
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    Left = 32
    Top = 8
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = '01001000/json/'
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 104
    Top = 9
  end
  object RESTResponse: TRESTResponse
    Left = 178
    Top = 9
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = cdsCadastro
    FieldDefs = <>
    Response = RESTResponse
    Left = 64
    Top = 80
  end
end
