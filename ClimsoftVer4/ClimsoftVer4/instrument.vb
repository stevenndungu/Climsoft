'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated from a template.
'
'     Manual changes to this file may cause unexpected behavior in your application.
'     Manual changes to this file will be overwritten if the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Collections.Generic

Partial Public Class instrument
    Public Property instrumentName As String
    Public Property instrumentId As String
    Public Property serialNumber As String
    Public Property abbreviation As String
    Public Property model As String
    Public Property manufacturer As String
    Public Property instrumentUncertainty As Nullable(Of Single)
    Public Property installationDatetime As String
    Public Property deinstallationDatetime As String
    Public Property height As String
    Public Property instrumentPicture As String
    Public Property installedAt As String

    Public Overridable Property stationelements As ICollection(Of stationelement) = New HashSet(Of stationelement)
    Public Overridable Property station As station
    Public Overridable Property instrumentfaultreports As ICollection(Of instrumentfaultreport) = New HashSet(Of instrumentfaultreport)
    Public Overridable Property instrumentinspections As ICollection(Of instrumentinspection) = New HashSet(Of instrumentinspection)

End Class
