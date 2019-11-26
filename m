Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415910997B
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:16:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MZvQ1xB8zDq6N
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 18:16:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=mail.ru
 (client-ip=94.100.176.132; helo=fallback22.mail.ru;
 envelope-from=9165394577@mail.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mail.ru header.i=@mail.ru header.b="dScUChpz"; 
 dkim=pass (1024-bit key) header.d=mail.ru header.i=@mail.ru
 header.b="dScUChpz"; dkim-atps=neutral
Received: from fallback22.mail.ru (fallback22.m.smailru.net [94.100.176.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MZtc3XhYzDqhT
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 18:15:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Type:MIME-Version:Date:Message-ID:Subject:From:To;
 bh=QdjU04HuZd0z9D1mgMRNnOLSlqdHhgmZp1VDg/p3DAY=; 
 b=dScUChpzPgXK1N+QaJ5LFqWbUdg9KxkCWSf4teqmxEzvLXbpLLmR3yw7gfnUaLj/OHBcQNDnCmTxwUxk76Qt0D3ihLgkq5z+XYAxRKBlcIK/QDu94WkOE4WRf3nL2fWsV3priaojMIkFHN7wrrgUyd8RtWr05cZlful8HkjR0RU=;
Received: from [10.161.64.51] (port=54172 helo=smtp43.i.mail.ru)
 by fallback22.m.smailru.net with esmtp (envelope-from <9165394577@mail.ru>)
 id 1iZV4M-0006SQ-1w
 for openbmc@lists.ozlabs.org; Tue, 26 Nov 2019 10:15:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Type:MIME-Version:Date:Message-ID:Subject:From:To;
 bh=QdjU04HuZd0z9D1mgMRNnOLSlqdHhgmZp1VDg/p3DAY=; 
 b=dScUChpzPgXK1N+QaJ5LFqWbUdg9KxkCWSf4teqmxEzvLXbpLLmR3yw7gfnUaLj/OHBcQNDnCmTxwUxk76Qt0D3ihLgkq5z+XYAxRKBlcIK/QDu94WkOE4WRf3nL2fWsV3priaojMIkFHN7wrrgUyd8RtWr05cZlful8HkjR0RU=;
Received: by smtp43.i.mail.ru with esmtpa (envelope-from <9165394577@mail.ru>)
 id 1iZV4D-0000JQ-02
 for openbmc@lists.ozlabs.org; Tue, 26 Nov 2019 10:15:21 +0300
To: openbmc@lists.ozlabs.org
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lk=?= <9165394577@mail.ru>
Subject: VLAN can not be created
Message-ID: <6fe6f97f-66e9-a055-3969-0a1dff901e4c@mail.ru>
Date: Tue, 26 Nov 2019 10:15:20 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------8E7AFDF0007987EC3E9A8E8E"
Content-Language: ru
X-77F55803: 2D1AD755E866B1545A78504BD2AC29411FA4F02123E218F90BE1FA8C329F39F17E5F73021AEC51289DCEE94B91A4CE5B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE722003BD978DAE1FCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FA6CCE696BC1867A8638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC9ACA751602B974EF3F5BD1262FFECE001C6D96C88376CEF8389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658359CC434672EE6371117882F4460429728AD0CFFFB425014E40A5AABA2AD371193AA81AA40904B5D9A18204E546F3947CA09ADEE969FA4D8BBA3038C0950A5D36C8A9BA7A39EFB766D187B4DA314F1B55BA3038C0950A5D36D5E8D9A59859A8B6B737A621A70BC7933AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D725E5C173C3A84C33522757A27FFDC072FF723E761BE66FE444A83B712AC0148C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F9A3D58A9A349F5073B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: C939162F3547A0A25661E4D8897749B8013659233F522B9267E7594D27DF0B5D6F46F3E7DDF2A4D4CD683AD8F64CCB9FCD26BA14935EF1A1EBB25DF8CDA217FBF24019644F7DBD5CCDD1A8804805D2EEC112642622160C5767EA787935ED9F1B
X-Mras: OK
X-77F55803: 5241C2F38277A35D7F9F52485CB584D7271FD7DF62800FDCC436E1EA9340E53C71EB871ACEC4F9AD4D91E5EC5A878F3950606C5866045FEF
X-7FA49CB5: 0D63561A33F958A5BF0AEB344FBDF7B8FC3D4900BC31A7EE1A393BF0744ED92D8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C22491819D55BF2DA05E976E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8B86F44BBDAD779E023AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D462275124DF8B9C975FAC89DD1A0FDCBE5BFE6E7EFDEDCD789D4C264860C145E
X-Mailru-MI: 1000
X-Mailru-Sender: A5480F10D64C900579012F43D24554B0BB4800A183FDC6F471EB871ACEC4F9AD4CF07495F417AF8BCD683AD8F64CCB9FCD26BA14935EF1A1EBB25DF8CDA217FBF24019644F7DBD5CCDD1A8804805D2EEC112642622160C5767EA787935ED9F1B
X-Mras: OK
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------8E7AFDF0007987EC3E9A8E8E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I want to create VLAN interface using the commands described here:

https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Network

but I get an error.

kury@kury-ubuntu-1604:~$ curl -c cjar -b cjar -k -H "Content-Type: 
application/json" -X POST -d '{"data":["eth1", 101] }' 
https://${bmc}/xyz/openbmc_project/network/action/VLAN
{
   "data": {
     "description": "org.freedesktop.DBus.Error.NoReply"
   },
   "message": "Remote peer disconnected",
   "status": "error"
}

or using bustl

kury@kury-ubuntu-1604:~$ ssh 192.168.4.186 -l root
root@192.168.4.186's password:
root@tiogapas2:~# busctl call xyz.openbmc_project.Network 
/xyz/openbmc_project/network xyz.openbmc_project.Network.VLAN.Create 
VLAN su "eth1" 101
Remote peer disconnected

Perhaps the syntax has changed? Or do I need to change the build settings?
Enumarate works correctly

kury@kury-ubuntu-1604:~$ curl -c cjar -b cjar -k -H "Content-Type: 
application/json" -X GET 
https://${bmc}/xyz/openbmc_project/network/enumerate
{
   "data": {
     "/xyz/openbmc_project/network/config": {
       "DefaultGateway": "192.168.4.1",
       "DefaultGateway6": "",
       "HostName": "tiogapas2"
     },
     "/xyz/openbmc_project/network/config/dhcp": {
       "DNSEnabled": true,
       "HostNameEnabled": true,
       "NTPEnabled": true,
       "SendHostNameEnabled": true
     },
     "/xyz/openbmc_project/network/eth0": {
       "AutoNeg": false,
       "DHCPEnabled": true,
       "DomainName": [],
       "IPv6AcceptRA": false,
       "InterfaceName": "eth0",
       "LinkLocalAutoConf": 
"xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",
       "MACAddress": "a6:1f:e2:d4:fc:20",
       "NTPServers": [],
       "Nameservers": [],
       "Speed": 0
     },
     "/xyz/openbmc_project/network/eth0/ipv4/48f8ed70": {
       "Address": "192.168.4.186",
       "Gateway": "",
       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.DHCP",
       "PrefixLength": 24,
       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
     },
     "/xyz/openbmc_project/network/eth0/ipv4/ee4bea56": {
       "Address": "169.254.5.72",
       "Gateway": "",
       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",
       "PrefixLength": 16,
       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
     },
     "/xyz/openbmc_project/network/eth0/ipv6/60f50253": {
       "Address": "fe80::a41f:e2ff:fed4:fc20",
       "Gateway": "",
       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",
       "PrefixLength": 64,
       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv6"
     },
     "/xyz/openbmc_project/network/eth1": {
       "AutoNeg": false,
       "DHCPEnabled": true,
       "DomainName": [],
       "IPv6AcceptRA": false,
       "InterfaceName": "eth1",
       "LinkLocalAutoConf": 
"xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",
       "MACAddress": "d6:92:52:7d:5:c8",
       "NTPServers": [],
       "Nameservers": [],
       "Speed": 0
     },
     "/xyz/openbmc_project/network/eth1/ipv4/42f65a13": {
       "Address": "192.168.4.187",
       "Gateway": "",
       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.DHCP",
       "PrefixLength": 24,
       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
     },
     "/xyz/openbmc_project/network/eth1/ipv4/4f48d4d1": {
       "Address": "169.254.241.120",
       "Gateway": "",
       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",
       "PrefixLength": 16,
       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
     },
     "/xyz/openbmc_project/network/eth1/ipv6/7fc4e2e8": {
       "Address": "fe80::d492:52ff:fe7d:5c8",
       "Gateway": "",
       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",
       "PrefixLength": 64,
       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv6"
     },
     "/xyz/openbmc_project/network/host0/intf": {
       "MACAddress": "00:00:00:00:00:00"
     },
     "/xyz/openbmc_project/network/host0/intf/addr": {
       "Address": "0.0.0.0",
       "Gateway": "0.0.0.0",
       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.Static",
       "PrefixLength": 0,
       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
     },
     "/xyz/openbmc_project/network/sit0": {
       "AutoNeg": false,
       "DHCPEnabled": true,
       "DomainName": [],
       "IPv6AcceptRA": false,
       "InterfaceName": "sit0",
       "LinkLocalAutoConf": 
"xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",
       "MACAddress": "0:0:0:0:0:0",
       "NTPServers": [],
       "Nameservers": [],
       "Speed": 0
     },
     "/xyz/openbmc_project/network/snmp/manager": {}
   },
   "message": "200 OK",
   "status": "ok"
   "status": "ok"


--------------8E7AFDF0007987EC3E9A8E8E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Helvetica, Arial, sans-serif">Hello,</font></p>
    <p><font face="Helvetica, Arial, sans-serif">I want to create VLAN
        interface using the commands described here:</font></p>
    <p><font face="Helvetica, Arial, sans-serif"><a
href="https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Network">https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Network</a><br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif"> but I get an error.</font></p>
    <p><tt>kury@kury-ubuntu-1604:~$ curl -c cjar -b cjar -k -H
        "Content-Type: application/json" -X POST -d '{"data":["eth1",
        101] }' <a class="moz-txt-link-freetext" href="https://$">https://$</a>{bmc}/xyz/openbmc_project/network/action/VLAN</tt><tt><br>
      </tt><tt>{</tt><tt><br>
      </tt><tt>  "data": {</tt><tt><br>
      </tt><tt>    "description": "org.freedesktop.DBus.Error.NoReply"</tt><tt><br>
      </tt><tt>  },</tt><tt><br>
      </tt><tt>  "message": "Remote peer disconnected",</tt><tt><br>
      </tt><tt>  "status": "error"</tt><tt><br>
      </tt><tt>}</tt><font face="Helvetica, Arial, sans-serif"><br>
        <br>
        or using bustl</font></p>
    <p><font face="Helvetica, Arial, sans-serif"></font><tt>kury@kury-ubuntu-1604:~$
        ssh 192.168.4.186 -l root</tt><tt><br>
      </tt><tt><a class="moz-txt-link-abbreviated" href="mailto:root@192.168.4.186">root@192.168.4.186</a>'s password: </tt><tt><br>
      </tt><tt>root@tiogapas2:~# busctl call xyz.openbmc_project.Network
        /xyz/openbmc_project/network
        xyz.openbmc_project.Network.VLAN.Create VLAN su "eth1" 101</tt><tt><br>
      </tt><tt>Remote peer disconnected</tt><font face="Helvetica,
        Arial, sans-serif"><br>
      </font></p>
    <p>Perhaps the syntax has changed? Or do I need to change the build
      settings?<br>
      Enumarate works correctly</p>
    <p><tt>kury@kury-ubuntu-1604:~$ curl -c cjar -b cjar -k -H
        "Content-Type: application/json" -X GET
        <a class="moz-txt-link-freetext" href="https://$">https://$</a>{bmc}/xyz/openbmc_project/network/enumerate</tt><tt><br>
      </tt><tt>{</tt><tt><br>
      </tt><tt>  "data": {</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/config": {</tt><tt><br>
      </tt><tt>      "DefaultGateway": "192.168.4.1",</tt><tt><br>
      </tt><tt>      "DefaultGateway6": "",</tt><tt><br>
      </tt><tt>      "HostName": "tiogapas2"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/config/dhcp": {</tt><tt><br>
      </tt><tt>      "DNSEnabled": true,</tt><tt><br>
      </tt><tt>      "HostNameEnabled": true,</tt><tt><br>
      </tt><tt>      "NTPEnabled": true,</tt><tt><br>
      </tt><tt>      "SendHostNameEnabled": true</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/eth0": {</tt><tt><br>
      </tt><tt>      "AutoNeg": false,</tt><tt><br>
      </tt><tt>      "DHCPEnabled": true,</tt><tt><br>
      </tt><tt>      "DomainName": [],</tt><tt><br>
      </tt><tt>      "IPv6AcceptRA": false,</tt><tt><br>
      </tt><tt>      "InterfaceName": "eth0",</tt><tt><br>
      </tt><tt>      "LinkLocalAutoConf":
        "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",</tt><tt><br>
      </tt><tt>      "MACAddress": "a6:1f:e2:d4:fc:20",</tt><tt><br>
      </tt><tt>      "NTPServers": [],</tt><tt><br>
      </tt><tt>      "Nameservers": [],</tt><tt><br>
      </tt><tt>      "Speed": 0</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/eth0/ipv4/48f8ed70": {</tt><tt><br>
      </tt><tt>      "Address": "192.168.4.186",</tt><tt><br>
      </tt><tt>      "Gateway": "",</tt><tt><br>
      </tt><tt>      "Origin":
        "xyz.openbmc_project.Network.IP.AddressOrigin.DHCP",</tt><tt><br>
      </tt><tt>      "PrefixLength": 24,</tt><tt><br>
      </tt><tt>      "Type":
        "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/eth0/ipv4/ee4bea56": {</tt><tt><br>
      </tt><tt>      "Address": "169.254.5.72",</tt><tt><br>
      </tt><tt>      "Gateway": "",</tt><tt><br>
      </tt><tt>      "Origin":
        "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",</tt><tt><br>
      </tt><tt>      "PrefixLength": 16,</tt><tt><br>
      </tt><tt>      "Type":
        "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/eth0/ipv6/60f50253": {</tt><tt><br>
      </tt><tt>      "Address": "fe80::a41f:e2ff:fed4:fc20",</tt><tt><br>
      </tt><tt>      "Gateway": "",</tt><tt><br>
      </tt><tt>      "Origin":
        "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",</tt><tt><br>
      </tt><tt>      "PrefixLength": 64,</tt><tt><br>
      </tt><tt>      "Type":
        "xyz.openbmc_project.Network.IP.Protocol.IPv6"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/eth1": {</tt><tt><br>
      </tt><tt>      "AutoNeg": false,</tt><tt><br>
      </tt><tt>      "DHCPEnabled": true,</tt><tt><br>
      </tt><tt>      "DomainName": [],</tt><tt><br>
      </tt><tt>      "IPv6AcceptRA": false,</tt><tt><br>
      </tt><tt>      "InterfaceName": "eth1",</tt><tt><br>
      </tt><tt>      "LinkLocalAutoConf":
        "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",</tt><tt><br>
      </tt><tt>      "MACAddress": "d6:92:52:7d:5:c8",</tt><tt><br>
      </tt><tt>      "NTPServers": [],</tt><tt><br>
      </tt><tt>      "Nameservers": [],</tt><tt><br>
      </tt><tt>      "Speed": 0</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/eth1/ipv4/42f65a13": {</tt><tt><br>
      </tt><tt>      "Address": "192.168.4.187",</tt><tt><br>
      </tt><tt>      "Gateway": "",</tt><tt><br>
      </tt><tt>      "Origin":
        "xyz.openbmc_project.Network.IP.AddressOrigin.DHCP",</tt><tt><br>
      </tt><tt>      "PrefixLength": 24,</tt><tt><br>
      </tt><tt>      "Type":
        "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/eth1/ipv4/4f48d4d1": {</tt><tt><br>
      </tt><tt>      "Address": "169.254.241.120",</tt><tt><br>
      </tt><tt>      "Gateway": "",</tt><tt><br>
      </tt><tt>      "Origin":
        "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",</tt><tt><br>
      </tt><tt>      "PrefixLength": 16,</tt><tt><br>
      </tt><tt>      "Type":
        "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/eth1/ipv6/7fc4e2e8": {</tt><tt><br>
      </tt><tt>      "Address": "fe80::d492:52ff:fe7d:5c8",</tt><tt><br>
      </tt><tt>      "Gateway": "",</tt><tt><br>
      </tt><tt>      "Origin":
        "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",</tt><tt><br>
      </tt><tt>      "PrefixLength": 64,</tt><tt><br>
      </tt><tt>      "Type":
        "xyz.openbmc_project.Network.IP.Protocol.IPv6"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/host0/intf": {</tt><tt><br>
      </tt><tt>      "MACAddress": "00:00:00:00:00:00"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/host0/intf/addr": {</tt><tt><br>
      </tt><tt>      "Address": "0.0.0.0",</tt><tt><br>
      </tt><tt>      "Gateway": "0.0.0.0",</tt><tt><br>
      </tt><tt>      "Origin":
        "xyz.openbmc_project.Network.IP.AddressOrigin.Static",</tt><tt><br>
      </tt><tt>      "PrefixLength": 0,</tt><tt><br>
      </tt><tt>      "Type":
        "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/sit0": {</tt><tt><br>
      </tt><tt>      "AutoNeg": false,</tt><tt><br>
      </tt><tt>      "DHCPEnabled": true,</tt><tt><br>
      </tt><tt>      "DomainName": [],</tt><tt><br>
      </tt><tt>      "IPv6AcceptRA": false,</tt><tt><br>
      </tt><tt>      "InterfaceName": "sit0",</tt><tt><br>
      </tt><tt>      "LinkLocalAutoConf":
        "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",</tt><tt><br>
      </tt><tt>      "MACAddress": "0:0:0:0:0:0",</tt><tt><br>
      </tt><tt>      "NTPServers": [],</tt><tt><br>
      </tt><tt>      "Nameservers": [],</tt><tt><br>
      </tt><tt>      "Speed": 0</tt><tt><br>
      </tt><tt>    },</tt><tt><br>
      </tt><tt>    "/xyz/openbmc_project/network/snmp/manager": {}</tt><tt><br>
      </tt><tt>  },</tt><tt><br>
      </tt><tt>  "message": "200 OK",</tt><tt><br>
      </tt><tt>  "status": "ok"</tt><tt><br>
      </tt><tt>  "status": "ok"</tt><br>
    </p>
  </body>
</html>

--------------8E7AFDF0007987EC3E9A8E8E--
