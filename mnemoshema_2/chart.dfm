object FormChart: TFormChart
  Left = 0
  Top = 602
  BorderIcons = [biSystemMenu]
  Caption = #1043#1088#1072#1092#1080#1082#1080
  ClientHeight = 423
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  WindowState = wsMinimized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 24
    Width = 654
    Height = 369
    Align = alClient
    PopupMenu = PopupMenuPageControl
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 654
    Top = 24
    Width = 29
    Height = 369
    Align = alRight
    TabOrder = 1
    object btnHand: TSpeedButton
      Left = 1
      Top = 1
      Width = 27
      Height = 22
      Hint = #1050#1091#1088#1089#1086#1088
      Align = alTop
      GroupIndex = 1
      Down = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080808080808080808080808080808080808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
        80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF
        808080FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080808080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFF808080FFFFFF808080FFFF
        FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF80
        8080FFFFFF808080FFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFF808080808080FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF80
        8080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF80
        8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btnHandClick
      ExplicitLeft = 6
      ExplicitTop = 0
    end
    object btnZoom: TSpeedButton
      Left = 1
      Top = 23
      Width = 27
      Height = 22
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFC4C4C4707070B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C69696965656564A4A4AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C69696
        965656565A5A5AE0E0E0FFFFFFFFFFFFFFFFFFC9C4BF998D839284769F9182A2
        9488B1A79DD8D4D0E1E1E19696965656565A5A5AE3E3E3FFFFFFFFFFFFF6F5F4
        A0968D8F8071C3B8ADE8E1DCEBE1DAECDDD3DAC7B9B3A4967C70667877775A5A
        5AE3E3E3FFFFFFFFFFFFFFFFFF9E958C9E9082EEEBE7FFFFFFFFFEFDFFFBFAFF
        F8F5FFEEE6F0D9CBA19083796F66DFDFDFFFFFFFFFFFFFFFFFFFDAD7D4857566
        E8E1DCFFFEFDFFFEFDFFFCFBFFFBF9FFF9F6FFF4EFFFE9DEF4D8C9AD9C8DD3CF
        CAFFFFFFFFFFFFFFFFFF9E958CB4A69AFEF9F6FFFBF9FFFBFAFFFBF9A9522CFF
        F8F4FFF6F1FFECE3FFE4D7CBB19EA1968CFFFFFFFFFFFFFFFFFF8C8074D3C6BC
        FFF7F3FFF8F6FFF9F6FFF9F6B75B34FFF6F2FFF5F0FFEADFFFE2D4DABAA78879
        6BFFFFFFFFFFFFFFFFFF877A6DE2D4CBFFF4EFFFF6F2DD764AD06D43C3643BB7
        5B34A9522CFFE9DFFFE1D2D8B7A3837364FFFFFFFFFFFFFFFFFFA49A91DACBC0
        FFF2ECFFF4EFFFF4EFFFF0E9D06D43FFECE3FFF1EAFFF1EBFEDDCECAA68F7D6E
        5FFFFFFFFFFFFFFFFFFFB9B3ADC1B2A6FEEFE8FFEDE4FFEAE0FFEEE6DD764AFF
        F2ECFFF1EBFFF1E9F0CBB6AA8D77A2978EFFFFFFFFFFFFFFFFFFEFEDEBA4998E
        E3D3C9FEF0E9FFF2EBFFF2EBFFF1EBFFF1EAFFF0E9F8E3D7C49C83857565DAD7
        D4FFFFFFFFFFFFFFFFFFFFFFFFCAC5BFB2A69BE1D0C5F8E8E0FDEDE5FDEEE6FB
        EBE2F4E2D8CAAD998C7969A69E96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        CBC6C0A89E94C3B5AAD6C5B9DCC9BDCFBBADB6A6988A7C6EB0A8A1FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1EFC5BFB9B7B0A8B3A79BAF
        A69DB5AEA7DEDBD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnZoomClick
      ExplicitLeft = 6
      ExplicitTop = 22
      ExplicitWidth = 29
    end
    object btnZoomOut: TSpeedButton
      Left = 1
      Top = 45
      Width = 27
      Height = 22
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073' 1:1'
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFC4C4C4707070B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C69696965656564A4A4AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C69696
        965656565A5A5AE0E0E0FFFFFFFFFFFFFFFFFFC9C4BF998D839284769F9182A2
        9488B1A79DD8D4D0E1E1E19696965656565A5A5AE3E3E3FFFFFFFFFFFFF6F5F4
        A0968D8F8071C3B8ADE8E1DCEBE1DAECDDD3DAC7B9B3A4967C70667877775A5A
        5AE3E3E3FFFFFFFFFFFFFFFFFF9E958C9E9082EEEBE7FFFFFFFFFEFDFFFBFAFF
        F8F5FFEEE6F0D9CBA19083796F66DFDFDFFFFFFFFFFFFFFFFFFFDAD7D4857566
        E8E1DCFFFEFDFFFEFDFFFCFBFFFBF9FFF9F6FFF4EFFFE9DEF4D8C9AD9C8DD3CF
        CAFFFFFFFFFFFFFFFFFF9E958CB4A69AFEF9F6FFFBF9FFFBFAFFFBF9FFF9F6FF
        F8F4FFF6F1FFECE3FFE4D7CBB19EA1968CFFFFFFFFFFFFFFFFFF8C8074D3C6BC
        FFF7F3FFF8F6FFF9F6FFF9F6FFF9F6FFF6F2FFF5F0FFEADFFFE2D4DABAA78879
        6BFFFFFFFFFFFFFFFFFF877A6DE2D4CBFFF4EFFFF6F2DD764AD06D43C3643BB7
        5B34A9522CFFE9DFFFE1D2D8B7A3837364FFFFFFFFFFFFFFFFFFA49A91DACBC0
        FFF2ECFFF4EFFFF4EFFFF0E9FFF9F6FFF9F6FFF1EAFFF1EBFEDDCECAA68F7D6E
        5FFFFFFFFFFFFFFFFFFFB9B3ADC1B2A6FEEFE8FFEDE4FFEAE0FFEEE6FFF9F6FF
        F2ECFFF1EBFFF1E9F0CBB6AA8D77A2978EFFFFFFFFFFFFFFFFFFEFEDEBA4998E
        E3D3C9FEF0E9FFF2EBFFF2EBFFF1EBFFF1EAFFF0E9F8E3D7C49C83857565DAD7
        D4FFFFFFFFFFFFFFFFFFFFFFFFCAC5BFB2A69BE1D0C5F8E8E0FDEDE5FDEEE6FB
        EBE2F4E2D8CAAD998C7969A69E96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        CBC6C0A89E94C3B5AAD6C5B9DCC9BDCFBBADB6A6988A7C6EB0A8A1FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1EFC5BFB9B7B0A8B3A79BAF
        A69DB5AEA7DEDBD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnZoomOutClick
      ExplicitLeft = 6
      ExplicitTop = 38
      ExplicitWidth = 29
    end
    object btnText: TSpeedButton
      Left = 1
      Top = 67
      Width = 27
      Height = 22
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1076#1087#1080#1089#1100
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFF989898
        5050505050505050505050505050505050505050505050505050505050505050
        50505050989898FFFFFFFFFFFF545454FFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFF545454FFFFFFFFFFFF585858
        FDFDFDF3F3F3F3F3F3F2F2F2F2F2F2F2F2F2F1F1F1F1F1F1F0F0F0F0F0F0EFEF
        EFFDFDFD585858FFFFFFFFFFFF5E5E5EFDFDFDF2F2F28D8D8D8D8D8D8D8D8D8D
        8D8D8D8D8D8D8D8D8D8D8D8D8D8DEEEEEEFDFDFD5E5E5EFFFFFFFFFFFF636363
        FDFDFDF2F2F2F1F1F1F1F1F1F0F0F0F0F0F0EFEFEFEFEFEFEEEEEEEEEEEEEDED
        EDFDFDFD636363FFFFFFFFFFFF6A6A6AFDFDFDF1F1F196969696969695959595
        9595959595959595959595959595ECECECFDFDFD6A6A6AFFFFFFFFFFFF707070
        FDFDFDF0F0F0EFEFEFEFEFEFEEEEEEEEEEEEEDEDEDEDEDEDECECECEBEBEBEBEB
        EBFDFDFD707070FFFFFFFFFFFF777777FDFDFDEFEFEFA0A0A09F9F9F9F9F9F9F
        9F9F9F9F9F9F9F9F9F9F9F9F9F9FEAEAEAFDFDFD777777FFFFFFFFFFFF7D7D7D
        FDFDFDEDEDEDEDEDEDECECECECECECEBEBEBEBEBEBEAEAEAEAEAEAE9E9E9E9E9
        E9FDFDFD7D7D7DFFFFFFFFFFFF848484FDFDFDECECECAAAAAAA9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9E7E7E7FDFDFD848484FFFFFFFFFFFF8A8A8A
        FDFDFDEBEBEBEBEBEBEAEAEAEAEAEAE9E9E9E8E8E8FDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFD8A8A8AFFFFFFFFFFFF909090FDFDFDEAEAEAAFAFAFAFAFAFAFAFAFAF
        AFAFAFAFAFFDFDFDE0E0E0E5E5E5EBEBEB909090BEBEBEFFFFFFFFFFFF959595
        FDFDFDE9E9E9E8E8E8E8E8E8E7E7E7E7E7E7E6E6E6FDFDFDE5E5E5EBEBEB9595
        95C1C1C1FFFFFFFFFFFFFFFFFF9A9A9AFDFDFDE8E8E8E7E7E7E7E7E7E6E6E6E5
        E5E5E5E5E5FDFDFDEBEBEB9A9A9AC4C4C4FFFFFFFFFFFFFFFFFFFFFFFF9E9E9E
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD9E9E9EC6C6C6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C8A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1
        A1A1A1A1A1A1A1A1C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnTextClick
      ExplicitLeft = 0
      ExplicitTop = 44
      ExplicitWidth = 40
    end
    object btnVLine: TSpeedButton
      Left = 1
      Top = 89
      Width = 27
      Height = 22
      Hint = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100' '#1083#1080#1085#1080#1102' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1075#1088#1072#1092#1080#1082#1072
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5
        000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E500
        0000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E50000
        00E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE5E5E5000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnVLineClick
      ExplicitLeft = 0
      ExplicitTop = 66
      ExplicitWidth = 40
    end
    object btnVLines: TSpeedButton
      Left = 1
      Top = 111
      Width = 27
      Height = 22
      Hint = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100' '#1083#1080#1085#1080#1102' '#1076#1083#1103' '#1074#1089#1077#1093' '#1075#1088#1072#1092#1080#1082#1086#1074
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFF000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5FFFFFF
        FFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5000000E5
        E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000
        E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFE5
        E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFF
        FFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5000000E5E5
        E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5
        E5E5FFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFE5E5
        E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5
        E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFF
        FFFFFFFFE5E5E5000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE5E5E5000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E5E5
        E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE5E5E5000000FFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnVLinesClick
      ExplicitLeft = 0
      ExplicitTop = 74
      ExplicitWidth = 28
    end
    object btnScaleXInc: TSpeedButton
      Left = 1
      Top = 146
      Width = 27
      Height = 22
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073' '#1087#1086' '#1086#1089#1080' '#1074#1088#1077#1084#1077#1085#1080
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF404040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040404040
        40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0404040FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF404040C0C0C0404040FFFFFFFFFFFFFFFFFF404040
        C0C0C0C0C0C0404040404040404040404040404040404040404040404040C0C0
        C0C0C0C0404040FFFFFF404040C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0404040404040C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0404040FFFFFF404040C0C0C0C0C0C040404040404040404040
        4040404040404040404040404040C0C0C0C0C0C0404040FFFFFFFFFFFFFFFFFF
        404040C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0C0
        C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040404040FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF404040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnScaleXIncClick
      ExplicitLeft = 0
      ExplicitTop = 145
      ExplicitWidth = 29
    end
    object btnScaleXDec: TSpeedButton
      Left = 1
      Top = 168
      Width = 27
      Height = 22
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073' '#1087#1086' '#1086#1089#1080' '#1074#1088#1077#1084#1077#1085#1080
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF404040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040404040
        40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0404040FFFFFFFF
        FFFFFFFFFFFFFFFF404040C0C0C0404040FFFFFFFFFFFFFFFFFF404040404040
        404040404040C0C0C0C0C0C0404040FFFFFFFFFFFF404040C0C0C0C0C0C04040
        40404040404040404040404040C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C040
        4040404040C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0404040404040C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0404040404040C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0404040404040404040404040404040C0C0C0C0C0C0404040FF
        FFFFFFFFFF404040C0C0C0C0C0C0404040404040404040404040FFFFFFFFFFFF
        FFFFFF404040C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C04040
        40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040404040FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF404040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnScaleXDecClick
      ExplicitLeft = 6
      ExplicitTop = 38
      ExplicitWidth = 29
    end
    object btnScaleYInc: TSpeedButton
      Left = 1
      Top = 203
      Width = 27
      Height = 22
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073' '#1087#1086' '#1086#1089#1080' '#1079#1085#1072#1095#1077#1085#1080#1081
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040404040FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0
        C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0C0C0C0C0C0C0404040FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF404040404040404040C0C0C0C0C0C0404040404040404040FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0
        C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0404040FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0
        C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0404040FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0
        C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0404040FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040404040404040C0
        C0C0C0C0C0404040404040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF404040C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0404040FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0
        C0C0C0C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0404040FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
        4040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnScaleYIncClick
      ExplicitLeft = 6
      ExplicitTop = 196
      ExplicitWidth = 29
    end
    object btnScaleYDec: TSpeedButton
      Left = 1
      Top = 225
      Width = 27
      Height = 22
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073' '#1087#1086' '#1086#1089#1080' '#1079#1085#1072#1095#1077#1085#1080#1081
      Align = alTop
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF404040404040404040404040FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0
        C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0404040FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040404040404040C0
        C0C0C0C0C0404040404040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF404040C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0404040FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0
        C0C0C0C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0404040FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
        4040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040404040FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0
        C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0C0C0C0C0C0C0404040FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF404040404040404040C0C0C0C0C0C0404040404040404040FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040C0
        C0C0C0C0C0404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF404040C0C0C0C0C0C0404040FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404040
        4040404040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnScaleYDecClick
      ExplicitLeft = 0
      ExplicitTop = 271
      ExplicitWidth = 29
    end
    object Panel6: TPanel
      Left = 1
      Top = 133
      Width = 27
      Height = 13
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel8: TPanel
      Left = 1
      Top = 190
      Width = 27
      Height = 13
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 393
    Width = 683
    Height = 30
    Align = alBottom
    TabOrder = 2
    object ShapeVericalSep1: TShape
      AlignWithMargins = True
      Left = 192
      Top = 4
      Width = 1
      Height = 22
      Align = alLeft
      ExplicitLeft = 242
      ExplicitTop = -2
      ExplicitHeight = 65
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 436
      Top = 4
      Width = 4
      Height = 22
      Align = alLeft
      Caption = '-'
      ExplicitHeight = 13
    end
    object RadioButtonOnline: TRadioButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 73
      Height = 22
      Align = alLeft
      Caption = #1087#1086#1089#1083#1077#1076#1085#1080#1077
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButtonOnlineClick
    end
    object ComboBoxTimeRange: TComboBox
      AlignWithMargins = True
      Left = 83
      Top = 4
      Width = 103
      Height = 21
      Align = alLeft
      Style = csDropDownList
      TabOrder = 1
      OnChange = ComboBoxTimeRangeChange
    end
    object RadioButtonOffline: TRadioButton
      AlignWithMargins = True
      Left = 199
      Top = 4
      Width = 69
      Height = 22
      Align = alLeft
      Caption = #1076#1080#1072#1087#1072#1079#1086#1085
      TabOrder = 2
      OnClick = RadioButtonOfflineClick
    end
    object Time2: TDateTimePicker
      AlignWithMargins = True
      Left = 527
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Date = 42191.493061469900000000
      Time = 42191.493061469900000000
      Kind = dtkTime
      TabOrder = 3
    end
    object Time1: TDateTimePicker
      AlignWithMargins = True
      Left = 355
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Date = 42191.493061469900000000
      Time = 42191.493061469900000000
      Kind = dtkTime
      TabOrder = 4
    end
    object Date2: TDateTimePicker
      AlignWithMargins = True
      Left = 446
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Date = 42191.493061469900000000
      Time = 42191.493061469900000000
      TabOrder = 5
    end
    object Date1: TDateTimePicker
      AlignWithMargins = True
      Left = 274
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Date = 42191.493061469900000000
      Time = 42191.493061469900000000
      TabOrder = 6
    end
    object ButtonRequestData: TButton
      AlignWithMargins = True
      Left = 608
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 7
      OnClick = ButtonRequestDataClick
    end
  end
  object v: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 24
    Align = alTop
    TabOrder = 3
    object CheckBoxMedianFilter: TCheckBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 120
      Height = 16
      Align = alLeft
      Caption = #1052#1077#1076#1080#1072#1085#1085#1099#1081' '#1092#1080#1100#1090#1088
      TabOrder = 0
      OnClick = CheckBoxMedianFilterClick
    end
    object CheckBoxGaussianFilter: TCheckBox
      AlignWithMargins = True
      Left = 130
      Top = 4
      Width = 103
      Height = 16
      Align = alLeft
      Caption = #1060#1080#1083#1100#1090#1088' '#1043#1072#1091#1089#1089#1072
      TabOrder = 1
      OnClick = CheckBoxGaussianFilterClick
    end
  end
  object PopupMenuChart: TPopupMenu
    OnPopup = PopupMenuChartPopup
    Left = 456
    Top = 120
    object PMTrack: TMenuItem
      Caption = #1054#1090#1089#1083#1077#1078#1080#1074#1072#1090#1100' '#1089#1080#1075#1085#1072#1083
      OnClick = PMTrackClick
    end
    object PMSaveAsImage: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      OnClick = PMSaveAsImageClick
    end
    object PMSaveAllAsImage: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1089#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
      OnClick = PMSaveAllAsImageClick
    end
    object PMDeleteChart: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1072#1092#1080#1082
      OnClick = PMDeleteChartClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object PMShowVirtMark: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1057#1082#1088#1099#1090#1100' '#1074#1080#1088#1090#1091#1072#1083#1100#1085#1091#1102' '#1091#1089#1090#1072#1074#1082#1091
      Enabled = False
    end
    object PMSetVirtMark: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1080#1088#1090#1091#1072#1083#1100#1085#1091#1102' '#1091#1089#1090#1072#1074#1082#1091
      Enabled = False
    end
    object PMDeleteMarker: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1072#1088#1082#1077#1088
      OnClick = PMDeleteMarkerClick
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'bmp'
    Filter = #1060#1072#1081#1083' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103' (*.bmp)|*.bmp'
    Left = 456
    Top = 171
  end
  object PopupMenuPageControl: TPopupMenu
    Left = 456
    Top = 224
    object PMNewPage: TMenuItem
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1082#1083#1072#1076#1082#1072
      OnClick = PMNewPageClick
    end
    object PMChangePageTitle: TMenuItem
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
      OnClick = PMChangePageTitleClick
    end
    object PMDeletePage: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
      OnClick = PMDeletePageClick
    end
  end
end
