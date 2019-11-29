Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407F10D7CD
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 16:20:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PdVW6vvYzDqpJ
	for <lists+openbmc@lfdr.de>; Sat, 30 Nov 2019 02:20:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=mail.ru
 (client-ip=185.5.136.252; helo=fallback20.mail.ru;
 envelope-from=9165394577@mail.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mail.ru header.i=@mail.ru header.b="GPJfE8Su"; 
 dkim=pass (1024-bit key) header.d=mail.ru header.i=@mail.ru
 header.b="GPJfE8Su"; dkim-atps=neutral
Received: from fallback20.mail.ru (fallback20.mail.ru [185.5.136.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PdQf3swpzDqLT
 for <openbmc@lists.ozlabs.org>; Sat, 30 Nov 2019 02:16:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=5+xRmJiwzmXi4ivHx93PxjitTUjLP7T7o2gCpKBjz8A=; 
 b=GPJfE8SuA25qJtJGGv8V4XBMw3wY1CQqyxG7qlhGigEztQX50hb1VRx/p2Yn+oCmUptxXyJiHNIVn0uF2PqC8i+CBXZv8OiaTGjyG3113Ha/AEaF256mChaJ2ONGoCrOP18fxvVU9mBKCHfLVsDgrTX4SQ0eWbV7lj8PeRNhaGw=;
Received: from [10.161.64.55] (port=59630 helo=smtp47.i.mail.ru)
 by fallback20.m.smailru.net with esmtp (envelope-from <9165394577@mail.ru>)
 id 1iai0q-0002JJ-Pp
 for openbmc@lists.ozlabs.org; Fri, 29 Nov 2019 18:16:53 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=5+xRmJiwzmXi4ivHx93PxjitTUjLP7T7o2gCpKBjz8A=; 
 b=GPJfE8SuA25qJtJGGv8V4XBMw3wY1CQqyxG7qlhGigEztQX50hb1VRx/p2Yn+oCmUptxXyJiHNIVn0uF2PqC8i+CBXZv8OiaTGjyG3113Ha/AEaF256mChaJ2ONGoCrOP18fxvVU9mBKCHfLVsDgrTX4SQ0eWbV7lj8PeRNhaGw=;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from <9165394577@mail.ru>)
 id 1iai0g-0004RH-De; Fri, 29 Nov 2019 18:16:42 +0300
Subject: Re: VLAN can not be created
To: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <6fe6f97f-66e9-a055-3969-0a1dff901e4c@mail.ru>
 <MWHPR13MB1360162F4FF24662001FCF0BED470@MWHPR13MB1360.namprd13.prod.outlook.com>
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lk=?= <9165394577@mail.ru>
Message-ID: <cb356715-91ee-372f-0428-01b505327c19@mail.ru>
Date: Fri, 29 Nov 2019 18:16:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <MWHPR13MB1360162F4FF24662001FCF0BED470@MWHPR13MB1360.namprd13.prod.outlook.com>
Content-Type: multipart/mixed; boundary="------------454787088A7B17CF563616E6"
Content-Language: ru
X-77F55803: BBE463BEF7A60BD05A78504BD2AC29419866B4965ABE1B7A301BB345B357F27818815B033D13BBF6D3682124DB27A106
X-7FA49CB5: 0D63561A33F958A5CBFEA6BEF8FFB8E2D31C3F20D9FD3BA2983E4C491303A2258941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C224914053F143637FD2C76E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8B9189C45C6E258D8C3AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D725E5C173C3A84C37F2E9035E9FA3B822DB87C3E86F53D5FBEFCD6C56BCFE9CEC4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F9A3D58A9A349F5073B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: C939162F3547A0A25661E4D8897749B857C7D5974729B03AEBF23AADCE8E367BFADA28E124720B3CCD683AD8F64CCB9FCD26BA14935EF1A1EBB25DF8CDA217FBF24019644F7DBD5CCDD1A8804805D2EEC112642622160C5767EA787935ED9F1B
X-Mras: OK
X-77F55803: 6AF0DA0BABFA9FDB7F9F52485CB584D7271FD7DF62800FDC62F3C084EE91CD564DA9CD8F6A90FC815FFCD5E50086527904C0DDE19B4C4C6A
X-7FA49CB5: 0D63561A33F958A57345E358C600BFA1DB2F906A542A450E3254086376AE3F698941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249E534D5F67D1EC79B76E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8B0C576453C6160EE83AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D462275124DF8B9C975FAC89DD1A0FDCBE5BFE6E7EFDEDCD789D4C264860C145E
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C9005EB82917A46D9527629B0BC6D293070414DA9CD8F6A90FC818BA964C4CC763D63CD683AD8F64CCB9FCD26BA14935EF1A1EBB25DF8CDA217FBF24019644F7DBD5CCDD1A8804805D2EEC112642622160C5767EA787935ED9F1B
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
--------------454787088A7B17CF563616E6
Content-Type: multipart/alternative;
 boundary="------------BBBB40072DF998609F452E1E"


--------------BBBB40072DF998609F452E1E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

You have wrote

"The exception were introduced in the following code segment:

https://github.com/openbmc/phosphor-networkd/commit/7ed1b286ae1620dd629d8cee8ae33ac4f7c53ecf 


I am removing the code from this patch, it does not affect.


I added a patch to find out the name of the interface.

After the request for the creation of VLAN journalctl issues such a message:

$ curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d 
'{"data":["eth0", 101] }' 
https://${bmc}/xyz/openbmc_project/network/action/VLAN

MESSAGE=ioctl failed for SIOCGIFHWADDR:
     ERROR=No such device; interface name=eth0.101

It may be necessary to configure the I210 chip? How to do this from the 
host side or from the BMC side?


PATCH

@@ -286,7 +287,7 @@
      if (ioctl(sock, SIOCGIFHWADDR, &ifr) != 0)
      {
          log<level::ERR>("ioctl failed for SIOCGIFHWADDR:",
-                        entry("ERROR=%s", strerror(errno)));
+                        entry("ERROR=%s; interface name=%s", 
strerror(errno),ifr.ifr_name));
          elog<InternalFailure>();
      }


REQUEST

$ curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d 
'{"data":["eth0", 101] }' 
https://${bmc}/xyz/openbmc_project/network/action/VLAN


OUTPUT

#> journalctl --system --no-pager  -o verbose

Fri 2019-11-29 13:32:33.155055 UTC 
[s=aa2f1931bf3a48f796ccfdcc9bfdd239;i=42e;b=c797c7925aab43048c9c7ce31b8e6df0;m=67107e44a;t=5987c4321124d;x=8ce7499c8bc03f18]
     _TRANSPORT=journal
     _UID=0
     _GID=0
     _CAP_EFFECTIVE=3fffffffff
     _BOOT_ID=c797c7925aab43048c9c7ce31b8e6df0
     _MACHINE_ID=36a71765a6b64369bcf11ca4cc6181f4
     _HOSTNAME=neptun2
     _SYSTEMD_SLICE=system.slice
     PRIORITY=3
     CODE_LINE=76
     CODE_FUNC=helper_log
CODE_FILE=/usr/src/debug/phosphor-network/1.0+gitAUTOINC+cb42fe26fe-r1/recipe-sysroot/usr/include/phosphor-logging/log.hpp
     SYSLOG_IDENTIFIER=phosphor-network-manager
     _COMM=phosphor-networ
     _EXE=/usr/bin/phosphor-network-manager
     _CMDLINE=phosphor-network-manager
_SYSTEMD_CGROUP=/system.slice/xyz.openbmc_project.Network.service
     _SYSTEMD_UNIT=xyz.openbmc_project.Network.service
     MESSAGE=ioctl failed for SIOCGIFHWADDR:
     ERROR=No such device; interface name=eth0.101
     _PID=518
     _SYSTEMD_INVOCATION_ID=b5cf12d81ba844e48c2d1a59a223c064
     TRANSACTION_ID=2449749800
     _SOURCE_REALTIME_TIMESTAMP=1575034353155055




28.11.2019 11:24, Troy.Lee@vertiv.com пишет:
>
> Hi Евгений,
>
> We also met the same issue.
>
> There is an exception raised in phosphor-networkd which doesn't handle 
> properly, so it turns out the phosphor-networkd crashed and restarted 
> by systemd.
>
> ```
>
> Jan 03 16:56:37 ast2500evb phosphor-network-manager[1881]: ioctl 
> failed for SIOCGIFHWADDR:
>
> Jan 03 16:56:37 ast2500evb phosphor-network-manager[1881]: terminate 
> called after throwing an instance of 
> 'sdbusplus::xyz::openbmc_project::Common::Error::InternalFailure'
>
> Jan 03 16:56:37 ast2500evb phosphor-network-manager[1881]:   what(): 
> xyz.openbmc_project.Common.Error.InternalFailure: The operation failed 
> internally.
>
> Jan 03 16:56:37 ast2500evb phosphor-network-manager[1881]: The 
> operation failed internally.
>
> ```
>
> The exception were introduced in the following code segment:
>
> https://github.com/openbmc/phosphor-networkd/commit/7ed1b286ae1620dd629d8cee8ae33ac4f7c53ecf
>
> Is there any patch we could apply for this issue?
>
> Thanks,
>
> Troy Lee
>
> *From:*openbmc <openbmc-bounces+troy.lee=vertiv.com@lists.ozlabs.org> 
> *On Behalf Of *???????
> *Sent:* Tuesday, November 26, 2019 3:15 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* [ExternalEmail] VLAN can not be created
>
> Hello,
>
> I want to create VLAN interface using the commands described here:
>
> https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Network
>
> but I get an error.
>
> kury@kury-ubuntu-1604:~$ curl -c cjar -b cjar -k -H "Content-Type: 
> application/json" -X POST -d '{"data":["eth1", 101] }' 
> https://${bmc}/xyz/openbmc_project/network/action/VLAN
> {
>   "data": {
>     "description": "org.freedesktop.DBus.Error.NoReply"
>   },
>   "message": "Remote peer disconnected",
>   "status": "error"
> }
>
> or using bustl
>
> kury@kury-ubuntu-1604:~$ ssh 192.168.4.186 -l root
> root@192.168.4.186 <mailto:root@192.168.4.186>'s password:
> root@tiogapas2:~# busctl call xyz.openbmc_project.Network 
> /xyz/openbmc_project/network xyz.openbmc_project.Network.VLAN.Create 
> VLAN su "eth1" 101
> Remote peer disconnected
>
> Perhaps the syntax has changed? Or do I need to change the build settings?
> Enumarate works correctly
>
> kury@kury-ubuntu-1604:~$ curl -c cjar -b cjar -k -H "Content-Type: 
> application/json" -X GET 
> https://${bmc}/xyz/openbmc_project/network/enumerate
> {
>   "data": {
>     "/xyz/openbmc_project/network/config": {
>       "DefaultGateway": "192.168.4.1",
>       "DefaultGateway6": "",
>       "HostName": "tiogapas2"
>     },
>     "/xyz/openbmc_project/network/config/dhcp": {
>       "DNSEnabled": true,
>       "HostNameEnabled": true,
>       "NTPEnabled": true,
>       "SendHostNameEnabled": true
>     },
>     "/xyz/openbmc_project/network/eth0": {
>       "AutoNeg": false,
>       "DHCPEnabled": true,
>       "DomainName": [],
>       "IPv6AcceptRA": false,
>       "InterfaceName": "eth0",
>       "LinkLocalAutoConf": 
> "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",
>       "MACAddress": "a6:1f:e2:d4:fc:20",
>       "NTPServers": [],
>       "Nameservers": [],
>       "Speed": 0
>     },
>     "/xyz/openbmc_project/network/eth0/ipv4/48f8ed70": {
>       "Address": "192.168.4.186",
>       "Gateway": "",
>       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.DHCP",
>       "PrefixLength": 24,
>       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
>     },
>     "/xyz/openbmc_project/network/eth0/ipv4/ee4bea56": {
>       "Address": "169.254.5.72",
>       "Gateway": "",
>       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",
>       "PrefixLength": 16,
>       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
>     },
>     "/xyz/openbmc_project/network/eth0/ipv6/60f50253": {
>       "Address": "fe80::a41f:e2ff:fed4:fc20",
>       "Gateway": "",
>       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",
>       "PrefixLength": 64,
>       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv6"
>     },
>     "/xyz/openbmc_project/network/eth1": {
>       "AutoNeg": false,
>       "DHCPEnabled": true,
>       "DomainName": [],
>       "IPv6AcceptRA": false,
>       "InterfaceName": "eth1",
>       "LinkLocalAutoConf": 
> "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",
>       "MACAddress": "d6:92:52:7d:5:c8",
>       "NTPServers": [],
>       "Nameservers": [],
>       "Speed": 0
>     },
>     "/xyz/openbmc_project/network/eth1/ipv4/42f65a13": {
>       "Address": "192.168.4.187",
>       "Gateway": "",
>       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.DHCP",
>       "PrefixLength": 24,
>       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
>     },
>     "/xyz/openbmc_project/network/eth1/ipv4/4f48d4d1": {
>       "Address": "169.254.241.120",
>       "Gateway": "",
>       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",
>       "PrefixLength": 16,
>       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
>     },
>     "/xyz/openbmc_project/network/eth1/ipv6/7fc4e2e8": {
>       "Address": "fe80::d492:52ff:fe7d:5c8",
>       "Gateway": "",
>       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",
>       "PrefixLength": 64,
>       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv6"
>     },
>     "/xyz/openbmc_project/network/host0/intf": {
>       "MACAddress": "00:00:00:00:00:00"
>     },
>     "/xyz/openbmc_project/network/host0/intf/addr": {
>       "Address": "0.0.0.0",
>       "Gateway": "0.0.0.0",
>       "Origin": "xyz.openbmc_project.Network.IP.AddressOrigin.Static",
>       "PrefixLength": 0,
>       "Type": "xyz.openbmc_project.Network.IP.Protocol.IPv4"
>     },
>     "/xyz/openbmc_project/network/sit0": {
>       "AutoNeg": false,
>       "DHCPEnabled": true,
>       "DomainName": [],
>       "IPv6AcceptRA": false,
>       "InterfaceName": "sit0",
>       "LinkLocalAutoConf": 
> "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",
>       "MACAddress": "0:0:0:0:0:0",
>       "NTPServers": [],
>       "Nameservers": [],
>       "Speed": 0
>     },
>     "/xyz/openbmc_project/network/snmp/manager": {}
>   },
>   "message": "200 OK",
>   "status": "ok"
>   "status": "ok"
>
> CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it 
> are intended solely for the use of the individual or entity to whom 
> they are addressed and may contain confidential and privileged 
> information protected by law. If you received this e-mail in error, 
> any review, use, dissemination, distribution, or copying of the e-mail 
> is strictly prohibited. Please notify the sender immediately by return 
> e-mail and delete all copies from your system. 

--------------BBBB40072DF998609F452E1E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Helvetica, Arial, sans-serif">Hello,</font></p>
    <p><tt>You have wrote<br>
      </tt></p>
    <p class="MsoNormal"><span
        style="font-family:&quot;Calibri&quot;,sans-serif" lang="EN-US"><tt>"</tt>The
        exception were introduced in the following code segment:</span></p>
    <span lang="EN-US"><a
href="https://github.com/openbmc/phosphor-networkd/commit/7ed1b286ae1620dd629d8cee8ae33ac4f7c53ecf">https://github.com/openbmc/phosphor-networkd/commit/7ed1b286ae1620dd629d8cee8ae33ac4f7c53ecf</a></span>
    <p><font face="Helvetica, Arial, sans-serif">I am removing the code
        from this patch, it does not affect.</font></p>
    <p><br>
    </p>
    <p><font face="Helvetica, Arial, sans-serif">I added a patch to find
        out the name of the interface.</font></p>
    <p><font face="Helvetica, Arial, sans-serif">After the request for
        the creation of VLAN journalctl issues such a message:</font></p>
    <p><tt>$ curl -c cjar -b cjar -k -H "Content-Type: application/json"
        -X POST -d '{"data":["eth0", 101] }' </tt><tt><a
          class="moz-txt-link-freetext" href="https://$">https://$</a></tt><tt>{bmc}/xyz/openbmc_project/network/action/VLAN</tt><font
        face="Helvetica, Arial, sans-serif"><br>
      </font> </p>
    <font face="Helvetica, Arial, sans-serif">
    </font>
    <p><font face="Helvetica, Arial, sans-serif"> </font><tt>  
        MESSAGE=ioctl failed for SIOCGIFHWADDR:</tt><tt><br>
      </tt><tt>
            ERROR=No such device; interface name=eth0.101</tt></p>
    <p><tt>It may be necessary to configure the I210 chip? How to do
        this from the host side or from the BMC side?</tt></p>
    <br>
    <p><font face="Helvetica, Arial, sans-serif">PATCH<br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif">@@ -286,7 +287,7 @@<br>
             if (ioctl(sock, SIOCGIFHWADDR, &amp;ifr) != 0)<br>
             {<br>
                 log&lt;level::ERR&gt;("ioctl failed for
        SIOCGIFHWADDR:",<br>
        -                        entry("ERROR=%s", strerror(errno)));<br>
        +                        entry("ERROR=%s; interface name=%s",
        strerror(errno),ifr.ifr_name));<br>
                 elog&lt;InternalFailure&gt;();<br>
             }</font></p>
    <p><font face="Helvetica, Arial, sans-serif"><br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif">REQUEST<br>
      </font></p>
    <p><tt>$ curl -c cjar -b cjar -k -H "Content-Type: application/json"
        -X POST -d '{"data":["eth0", 101] }' </tt><tt><a
          class="moz-txt-link-freetext" href="https://$">https://$</a></tt><tt>{bmc}/xyz/openbmc_project/network/action/VLAN</tt><font
        face="Helvetica, Arial, sans-serif"><tt><br>
        </tt></font></p>
    <p><font face="Helvetica, Arial, sans-serif"><tt><br>
        </tt></font></p>
    <p><font face="Helvetica, Arial, sans-serif"><tt>OUTPUT</tt></font></p>
    <p><font face="Helvetica, Arial, sans-serif"><tt>#&gt; journalctl
          --system --no-pager  -o verbose<br>
        </tt></font></p>
    <p><font face="Helvetica, Arial, sans-serif"><tt>Fri 2019-11-29
          13:32:33.155055 UTC
[s=aa2f1931bf3a48f796ccfdcc9bfdd239;i=42e;b=c797c7925aab43048c9c7ce31b8e6df0;m=67107e44a;t=5987c4321124d;x=8ce7499c8bc03f18]<br>
              _TRANSPORT=journal<br>
              _UID=0<br>
              _GID=0<br>
              _CAP_EFFECTIVE=3fffffffff<br>
              _BOOT_ID=c797c7925aab43048c9c7ce31b8e6df0<br>
              _MACHINE_ID=36a71765a6b64369bcf11ca4cc6181f4<br>
              _HOSTNAME=neptun2<br>
              _SYSTEMD_SLICE=system.slice<br>
              PRIORITY=3<br>
              CODE_LINE=76<br>
              CODE_FUNC=helper_log<br>
             
CODE_FILE=/usr/src/debug/phosphor-network/1.0+gitAUTOINC+cb42fe26fe-r1/recipe-sysroot/usr/include/phosphor-logging/log.hpp<br>
              SYSLOG_IDENTIFIER=phosphor-network-manager<br>
              _COMM=phosphor-networ<br>
              _EXE=/usr/bin/phosphor-network-manager<br>
              _CMDLINE=phosphor-network-manager<br>
             
          _SYSTEMD_CGROUP=/system.slice/xyz.openbmc_project.Network.service<br>
              _SYSTEMD_UNIT=xyz.openbmc_project.Network.service<br>
              MESSAGE=ioctl failed for SIOCGIFHWADDR:<br>
              ERROR=No such device; interface name=eth0.101<br>
              _PID=518<br>
              _SYSTEMD_INVOCATION_ID=b5cf12d81ba844e48c2d1a59a223c064<br>
              TRANSACTION_ID=2449749800<br>
              _SOURCE_REALTIME_TIMESTAMP=1575034353155055</tt></font></p>
    <p><font face="Helvetica, Arial, sans-serif"><tt><br>
        </tt></font></p>
    <p><font face="Helvetica, Arial, sans-serif"><tt><br>
        </tt></font></p>
    <p><font face="Helvetica, Arial, sans-serif"></font><br>
    </p>
    <div class="moz-cite-prefix">28.11.2019 11:24, <a class="moz-txt-link-abbreviated" href="mailto:Troy.Lee@vertiv.com">Troy.Lee@vertiv.com</a>
      пишет:<br>
    </div>
    <blockquote type="cite"
cite="mid:MWHPR13MB1360162F4FF24662001FCF0BED470@MWHPR13MB1360.namprd13.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:新細明體;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:細明體;
	panose-1:2 2 5 9 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@新細明體";
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@細明體";
	panose-1:2 2 5 9 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"新細明體",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
tt
	{mso-style-priority:99;
	font-family:細明體;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"新細明體",serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.pl-en
	{mso-style-name:pl-en;}
span.pl-k
	{mso-style-name:pl-k;}
span.EmailStyle23
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Hi Евгений,<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">We also met the same issue.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">There is an exception raised in
            phosphor-networkd which doesn't handle properly, so it turns
            out the phosphor-networkd crashed and restarted by systemd.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">```<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Jan 03 16:56:37 ast2500evb
            phosphor-network-manager[1881]: ioctl failed for
            SIOCGIFHWADDR:<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Jan 03 16:56:37 ast2500evb
            phosphor-network-manager[1881]: terminate called after
            throwing an instance of
            'sdbusplus::xyz::openbmc_project::Common::Error::InternalFailure'<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Jan 03 16:56:37 ast2500evb
            phosphor-network-manager[1881]:   what(): 
            xyz.openbmc_project.Common.Error.InternalFailure: The
            operation failed internally.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Jan 03 16:56:37 ast2500evb
            phosphor-network-manager[1881]: The operation failed
            internally.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">```<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">The exception were introduced in the following
            code segment:<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><a
href="https://github.com/openbmc/phosphor-networkd/commit/7ed1b286ae1620dd629d8cee8ae33ac4f7c53ecf"
              moz-do-not-send="true">https://github.com/openbmc/phosphor-networkd/commit/7ed1b286ae1620dd629d8cee8ae33ac4f7c53ecf</a></span><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Is there any patch we could apply for this
            issue?<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Thanks,<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Troy Lee<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p> </o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class="MsoNormal"><b><span
                  style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"
                  lang="EN-US">From:</span></b><span
                style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"
                lang="EN-US"> openbmc
                <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+troy.lee=vertiv.com@lists.ozlabs.org">&lt;openbmc-bounces+troy.lee=vertiv.com@lists.ozlabs.org&gt;</a>
                <b>On Behalf Of </b>???????<br>
                <b>Sent:</b> Tuesday, November 26, 2019 3:15 PM<br>
                <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
                <b>Subject:</b> [ExternalEmail] VLAN can not be created<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p><span style="font-family:&quot;Helvetica&quot;,sans-serif"
            lang="EN-US">Hello,</span><span lang="EN-US"><o:p></o:p></span></p>
        <p><span style="font-family:&quot;Helvetica&quot;,sans-serif"
            lang="EN-US">I want to create VLAN interface using the
            commands described here:</span><span lang="EN-US"><o:p></o:p></span></p>
        <p><span lang="EN-US"><a
href="https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Network"
              moz-do-not-send="true"><span
                style="font-family:&quot;Helvetica&quot;,sans-serif">https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Network</span></a><o:p></o:p></span></p>
        <p><span style="font-family:&quot;Helvetica&quot;,sans-serif"
            lang="EN-US">but I get an error.</span><span lang="EN-US"><o:p></o:p></span></p>
        <p><tt><span lang="EN-US">kury@kury-ubuntu-1604:~$ curl -c cjar
              -b cjar -k -H "Content-Type: application/json" -X POST -d
              '{"data":["eth1", 101] }'
            </span></tt><span lang="EN-US"><a href="https://$"
              moz-do-not-send="true"><span style="font-family:細明體">https://$</span></a></span><tt><span
              lang="EN-US">{bmc}/xyz/openbmc_project/network/action/VLAN</span></tt><span
            style="font-family:細明體" lang="EN-US"><br>
            <tt>{</tt><br>
            <tt>  "data": {</tt><br>
            <tt>    "description": "org.freedesktop.DBus.Error.NoReply"</tt><br>
            <tt>  },</tt><br>
            <tt>  "message": "Remote peer disconnected",</tt><br>
            <tt>  "status": "error"</tt><br>
            <tt>}</tt></span><span
            style="font-family:&quot;Helvetica&quot;,sans-serif"
            lang="EN-US"><br>
            <br>
            or using bustl</span><span lang="EN-US"><o:p></o:p></span></p>
        <p><tt><span lang="EN-US">kury@kury-ubuntu-1604:~$ ssh
              192.168.4.186 -l root</span></tt><span
            style="font-family:細明體" lang="EN-US"><br>
          </span><span lang="EN-US"><a href="mailto:root@192.168.4.186"
              moz-do-not-send="true"><span style="font-family:細明體">root@192.168.4.186</span></a></span><tt><span
              lang="EN-US">'s password:
            </span></tt><span style="font-family:細明體" lang="EN-US"><br>
            <tt>root@tiogapas2:~# busctl call
              xyz.openbmc_project.Network /xyz/openbmc_project/network
              xyz.openbmc_project.Network.VLAN.Create VLAN su "eth1" 101</tt><br>
            <tt>Remote peer disconnected</tt></span><span lang="EN-US"><o:p></o:p></span></p>
        <p><span lang="EN-US">Perhaps the syntax has changed? Or do I
            need to change the build settings?<br>
            Enumarate works correctly<o:p></o:p></span></p>
        <p><tt><span lang="EN-US">kury@kury-ubuntu-1604:~$ curl -c cjar
              -b cjar -k -H "Content-Type: application/json" -X GET
            </span></tt><span lang="EN-US"><a href="https://$"
              moz-do-not-send="true"><span style="font-family:細明體">https://$</span></a></span><tt><span
              lang="EN-US">{bmc}/xyz/openbmc_project/network/enumerate</span></tt><span
            style="font-family:細明體" lang="EN-US"><br>
            <tt>{</tt><br>
            <tt>  "data": {</tt><br>
            <tt>    "/xyz/openbmc_project/network/config": {</tt><br>
            <tt>      "DefaultGateway": "192.168.4.1",</tt><br>
            <tt>      "DefaultGateway6": "",</tt><br>
            <tt>      "HostName": "tiogapas2"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/config/dhcp": {</tt><br>
            <tt>      "DNSEnabled": true,</tt><br>
            <tt>      "HostNameEnabled": true,</tt><br>
            <tt>      "NTPEnabled": true,</tt><br>
            <tt>      "SendHostNameEnabled": true</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/eth0": {</tt><br>
            <tt>      "AutoNeg": false,</tt><br>
            <tt>      "DHCPEnabled": true,</tt><br>
            <tt>      "DomainName": [],</tt><br>
            <tt>      "IPv6AcceptRA": false,</tt><br>
            <tt>      "InterfaceName": "eth0",</tt><br>
            <tt>      "LinkLocalAutoConf":
              "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",</tt><br>
            <tt>      "MACAddress": "a6:1f:e2:d4:fc:20",</tt><br>
            <tt>      "NTPServers": [],</tt><br>
            <tt>      "Nameservers": [],</tt><br>
            <tt>      "Speed": 0</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/eth0/ipv4/48f8ed70": {</tt><br>
            <tt>      "Address": "192.168.4.186",</tt><br>
            <tt>      "Gateway": "",</tt><br>
            <tt>      "Origin":
              "xyz.openbmc_project.Network.IP.AddressOrigin.DHCP",</tt><br>
            <tt>      "PrefixLength": 24,</tt><br>
            <tt>      "Type":
              "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/eth0/ipv4/ee4bea56": {</tt><br>
            <tt>      "Address": "169.254.5.72",</tt><br>
            <tt>      "Gateway": "",</tt><br>
            <tt>      "Origin":
              "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",</tt><br>
            <tt>      "PrefixLength": 16,</tt><br>
            <tt>      "Type":
              "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/eth0/ipv6/60f50253": {</tt><br>
            <tt>      "Address": "fe80::a41f:e2ff:fed4:fc20",</tt><br>
            <tt>      "Gateway": "",</tt><br>
            <tt>      "Origin":
              "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",</tt><br>
            <tt>      "PrefixLength": 64,</tt><br>
            <tt>      "Type":
              "xyz.openbmc_project.Network.IP.Protocol.IPv6"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/eth1": {</tt><br>
            <tt>      "AutoNeg": false,</tt><br>
            <tt>      "DHCPEnabled": true,</tt><br>
            <tt>      "DomainName": [],</tt><br>
            <tt>      "IPv6AcceptRA": false,</tt><br>
            <tt>      "InterfaceName": "eth1",</tt><br>
            <tt>      "LinkLocalAutoConf":
              "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",</tt><br>
            <tt>      "MACAddress": "d6:92:52:7d:5:c8",</tt><br>
            <tt>      "NTPServers": [],</tt><br>
            <tt>      "Nameservers": [],</tt><br>
            <tt>      "Speed": 0</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/eth1/ipv4/42f65a13": {</tt><br>
            <tt>      "Address": "192.168.4.187",</tt><br>
            <tt>      "Gateway": "",</tt><br>
            <tt>      "Origin":
              "xyz.openbmc_project.Network.IP.AddressOrigin.DHCP",</tt><br>
            <tt>      "PrefixLength": 24,</tt><br>
            <tt>      "Type":
              "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/eth1/ipv4/4f48d4d1": {</tt><br>
            <tt>      "Address": "169.254.241.120",</tt><br>
            <tt>      "Gateway": "",</tt><br>
            <tt>      "Origin":
              "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",</tt><br>
            <tt>      "PrefixLength": 16,</tt><br>
            <tt>      "Type":
              "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/eth1/ipv6/7fc4e2e8": {</tt><br>
            <tt>      "Address": "fe80::d492:52ff:fe7d:5c8",</tt><br>
            <tt>      "Gateway": "",</tt><br>
            <tt>      "Origin":
              "xyz.openbmc_project.Network.IP.AddressOrigin.LinkLocal",</tt><br>
            <tt>      "PrefixLength": 64,</tt><br>
            <tt>      "Type":
              "xyz.openbmc_project.Network.IP.Protocol.IPv6"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/host0/intf": {</tt><br>
            <tt>      "MACAddress": "00:00:00:00:00:00"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/host0/intf/addr": {</tt><br>
            <tt>      "Address": "0.0.0.0",</tt><br>
            <tt>      "Gateway": "0.0.0.0",</tt><br>
            <tt>      "Origin":
              "xyz.openbmc_project.Network.IP.AddressOrigin.Static",</tt><br>
            <tt>      "PrefixLength": 0,</tt><br>
            <tt>      "Type":
              "xyz.openbmc_project.Network.IP.Protocol.IPv4"</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/sit0": {</tt><br>
            <tt>      "AutoNeg": false,</tt><br>
            <tt>      "DHCPEnabled": true,</tt><br>
            <tt>      "DomainName": [],</tt><br>
            <tt>      "IPv6AcceptRA": false,</tt><br>
            <tt>      "InterfaceName": "sit0",</tt><br>
            <tt>      "LinkLocalAutoConf":
              "xyz.openbmc_project.Network.EthernetInterface.LinkLocalConf.both",</tt><br>
            <tt>      "MACAddress": "0:0:0:0:0:0",</tt><br>
            <tt>      "NTPServers": [],</tt><br>
            <tt>      "Nameservers": [],</tt><br>
            <tt>      "Speed": 0</tt><br>
            <tt>    },</tt><br>
            <tt>    "/xyz/openbmc_project/network/snmp/manager": {}</tt><br>
            <tt>  },</tt><br>
            <tt>  "message": "200 OK",</tt><br>
            <tt>  "status": "ok"</tt><br>
            <tt>  "status": "ok"</tt></span><span lang="EN-US"><o:p></o:p></span></p>
      </div>
      CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with
      it are intended solely for the use of the individual or entity to
      whom they are addressed and may contain confidential and
      privileged information protected by law. If you received this
      e-mail in error, any review, use, dissemination, distribution, or
      copying of the e-mail is strictly prohibited. Please notify the
      sender immediately by return e-mail and delete all copies from
      your system.
    </blockquote>
  </body>
</html>

--------------BBBB40072DF998609F452E1E--

--------------454787088A7B17CF563616E6
Content-Type: text/plain; charset=UTF-8;
 name="journalctl-out.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="journalctl-out.txt"

RnJpIDIwMTktMTEtMjkgMTM6MzI6MzMuMTU1MDU1IFVUQyBbcz1hYTJmMTkzMWJmM2E0OGY3
OTZjY2ZkY2M5YmZkZDIzOTtpPTQyZTtiPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2
ZGYwO209NjcxMDdlNDRhO3Q9NTk4N2M0MzIxMTI0ZDt4PThjZTc0OTljOGJjMDNmMThdCiAg
ICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9VSUQ9MAogICAgX0dJRD0wCiAgICBfQ0FQX0VG
RkVDVElWRT0zZmZmZmZmZmZmCiAgICBfQk9PVF9JRD1jNzk3Yzc5MjVhYWI0MzA0OGM5Yzdj
ZTMxYjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZhNzE3NjVhNmI2NDM2OWJjZjExY2E0Y2M2
MTgxZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAgICBfU1lTVEVNRF9TTElDRT1zeXN0ZW0u
c2xpY2UKICAgIFBSSU9SSVRZPTMKICAgIENPREVfTElORT03NgogICAgQ09ERV9GVU5DPWhl
bHBlcl9sb2cKICAgIENPREVfRklMRT0vdXNyL3NyYy9kZWJ1Zy9waG9zcGhvci1uZXR3b3Jr
LzEuMCtnaXRBVVRPSU5DK2NiNDJmZTI2ZmUtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUvcGhvc3Bob3ItbG9nZ2luZy9sb2cuaHBwCiAgICBTWVNMT0dfSURFTlRJRklFUj1waG9z
cGhvci1uZXR3b3JrLW1hbmFnZXIKICAgIF9DT01NPXBob3NwaG9yLW5ldHdvcgogICAgX0VY
RT0vdXNyL2Jpbi9waG9zcGhvci1uZXR3b3JrLW1hbmFnZXIKICAgIF9DTURMSU5FPXBob3Nw
aG9yLW5ldHdvcmstbWFuYWdlcgogICAgX1NZU1RFTURfQ0dST1VQPS9zeXN0ZW0uc2xpY2Uv
eHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLnNlcnZpY2UKICAgIF9TWVNURU1EX1VOSVQ9
eHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLnNlcnZpY2UKICAgIE1FU1NBR0U9aW9jdGwg
ZmFpbGVkIGZvciBTSU9DR0lGSFdBRERSOgogICAgRVJST1I9Tm8gc3VjaCBkZXZpY2U7IGlu
dGVyZmFjZSBuYW1lPWV0aDAuMTAxCiAgICBfUElEPTUxOAogICAgX1NZU1RFTURfSU5WT0NB
VElPTl9JRD1iNWNmMTJkODFiYTg0NGU0OGMyZDFhNTlhMjIzYzA2NAogICAgVFJBTlNBQ1RJ
T05fSUQ9MjQ0OTc0OTgwMAogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAz
NDM1MzE1NTA1NQpGcmkgMjAxOS0xMS0yOSAxMzozMjozMy4xNjMyMTcgVVRDIFtzPWFhMmYx
OTMxYmYzYTQ4Zjc5NmNjZmRjYzliZmRkMjM5O2k9NDJmO2I9Yzc5N2M3OTI1YWFiNDMwNDhj
OWM3Y2UzMWI4ZTZkZjA7bT02NzEwN2VkY2E7dD01OTg3YzQzMjExYmQxO3g9MjAyNzk4YzU0
OGYwOGMwZV0KICAgIFBSSU9SSVRZPTYKICAgIFNZU0xPR19GQUNJTElUWT0zCiAgICBfVUlE
PTAKICAgIF9HSUQ9MAogICAgX0NBUF9FRkZFQ1RJVkU9M2ZmZmZmZmZmZgogICAgX0JPT1Rf
SUQ9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZkZjAKICAgIF9NQUNISU5FX0lEPTM2
YTcxNzY1YTZiNjQzNjliY2YxMWNhNGNjNjE4MWY0CiAgICBfSE9TVE5BTUU9bmVwdHVuMgog
ICAgX1NZU1RFTURfU0xJQ0U9c3lzdGVtLnNsaWNlCiAgICBfVFJBTlNQT1JUPXN0ZG91dAog
ICAgU1lTTE9HX0lERU5USUZJRVI9cGhvc3Bob3ItbmV0d29yay1tYW5hZ2VyCiAgICBfQ09N
TT1waG9zcGhvci1uZXR3b3IKICAgIF9FWEU9L3Vzci9iaW4vcGhvc3Bob3ItbmV0d29yay1t
YW5hZ2VyCiAgICBfQ01ETElORT1waG9zcGhvci1uZXR3b3JrLW1hbmFnZXIKICAgIF9TWVNU
RU1EX0NHUk9VUD0vc3lzdGVtLnNsaWNlL3h5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5z
ZXJ2aWNlCiAgICBfU1lTVEVNRF9VTklUPXh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5z
ZXJ2aWNlCiAgICBNRVNTQUdFPXRlcm1pbmF0ZSBjYWxsZWQgYWZ0ZXIgdGhyb3dpbmcgYW4g
aW5zdGFuY2Ugb2YgJ3NkYnVzcGx1czo6eHl6OjpvcGVuYm1jX3Byb2plY3Q6OkNvbW1vbjo6
RXJyb3I6OkludGVybmFsRmFpbHVyZScKICAgIF9QSUQ9NTE4CiAgICBfU1lTVEVNRF9JTlZP
Q0FUSU9OX0lEPWI1Y2YxMmQ4MWJhODQ0ZTQ4YzJkMWE1OWEyMjNjMDY0CiAgICBfU1RSRUFN
X0lEPTllMGM3NmY3YWZiODQ4MWNiMTMxMzBiZjkyNWI3ZjM4CkZyaSAyMDE5LTExLTI5IDEz
OjMyOjMzLjE2MzIxNyBVVEMgW3M9YWEyZjE5MzFiZjNhNDhmNzk2Y2NmZGNjOWJmZGQyMzk7
aT00MzA7Yj1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMDttPTY3MTA3ZWRjYTt0
PTU5ODdjNDMyMTFiZDE7eD0xNmJiYjJjMGRhMDM3N2ZhXQogICAgUFJJT1JJVFk9NgogICAg
U1lTTE9HX0ZBQ0lMSVRZPTMKICAgIF9VSUQ9MAogICAgX0dJRD0wCiAgICBfQ0FQX0VGRkVD
VElWRT0zZmZmZmZmZmZmCiAgICBfQk9PVF9JRD1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMx
YjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZhNzE3NjVhNmI2NDM2OWJjZjExY2E0Y2M2MTgx
ZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAgICBfU1lTVEVNRF9TTElDRT1zeXN0ZW0uc2xp
Y2UKICAgIF9UUkFOU1BPUlQ9c3Rkb3V0CiAgICBTWVNMT0dfSURFTlRJRklFUj1waG9zcGhv
ci1uZXR3b3JrLW1hbmFnZXIKICAgIF9DT01NPXBob3NwaG9yLW5ldHdvcgogICAgX0VYRT0v
dXNyL2Jpbi9waG9zcGhvci1uZXR3b3JrLW1hbmFnZXIKICAgIF9DTURMSU5FPXBob3NwaG9y
LW5ldHdvcmstbWFuYWdlcgogICAgX1NZU1RFTURfQ0dST1VQPS9zeXN0ZW0uc2xpY2UveHl6
Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLnNlcnZpY2UKICAgIF9TWVNURU1EX1VOSVQ9eHl6
Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLnNlcnZpY2UKICAgIE1FU1NBR0U9ICB3aGF0KCk6
ICB4eXoub3BlbmJtY19wcm9qZWN0LkNvbW1vbi5FcnJvci5JbnRlcm5hbEZhaWx1cmU6IFRo
ZSBvcGVyYXRpb24gZmFpbGVkIGludGVybmFsbHkuCiAgICBfUElEPTUxOAogICAgX1NZU1RF
TURfSU5WT0NBVElPTl9JRD1iNWNmMTJkODFiYTg0NGU0OGMyZDFhNTlhMjIzYzA2NAogICAg
X1NUUkVBTV9JRD05ZTBjNzZmN2FmYjg0ODFjYjEzMTMwYmY5MjViN2YzOApGcmkgMjAxOS0x
MS0yOSAxMzozMjozMy4xNTUzNDYgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5NmNjZmRjYzli
ZmRkMjM5O2k9NDMxO2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZkZjA7bT02NzEw
ODQ1YjM7dD01OTg3YzQzMjE3M2JkO3g9YjRmNjk0M2JmMDdiYjIxYV0KICAgIF9UUkFOU1BP
UlQ9am91cm5hbAogICAgX1VJRD0wCiAgICBfR0lEPTAKICAgIF9DQVBfRUZGRUNUSVZFPTNm
ZmZmZmZmZmYKICAgIF9CT09UX0lEPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYw
CiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAg
X0hPU1ROQU1FPW5lcHR1bjIKICAgIF9TWVNURU1EX1NMSUNFPXN5c3RlbS5zbGljZQogICAg
UFJJT1JJVFk9MwogICAgQ09ERV9MSU5FPTc2CiAgICBDT0RFX0ZVTkM9aGVscGVyX2xvZwog
ICAgQ09ERV9GSUxFPS91c3Ivc3JjL2RlYnVnL3Bob3NwaG9yLW5ldHdvcmsvMS4wK2dpdEFV
VE9JTkMrY2I0MmZlMjZmZS1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9waG9zcGhv
ci1sb2dnaW5nL2xvZy5ocHAKICAgIFNZU0xPR19JREVOVElGSUVSPXBob3NwaG9yLW5ldHdv
cmstbWFuYWdlcgogICAgX0NPTU09cGhvc3Bob3ItbmV0d29yCiAgICBfRVhFPS91c3IvYmlu
L3Bob3NwaG9yLW5ldHdvcmstbWFuYWdlcgogICAgX0NNRExJTkU9cGhvc3Bob3ItbmV0d29y
ay1tYW5hZ2VyCiAgICBfU1lTVEVNRF9DR1JPVVA9L3N5c3RlbS5zbGljZS94eXoub3BlbmJt
Y19wcm9qZWN0Lk5ldHdvcmsuc2VydmljZQogICAgX1NZU1RFTURfVU5JVD14eXoub3BlbmJt
Y19wcm9qZWN0Lk5ldHdvcmsuc2VydmljZQogICAgTUVTU0FHRT1UaGUgb3BlcmF0aW9uIGZh
aWxlZCBpbnRlcm5hbGx5LgogICAgX1BJRD01MTgKICAgIF9TWVNURU1EX0lOVk9DQVRJT05f
SUQ9YjVjZjEyZDgxYmE4NDRlNDhjMmQxYTU5YTIyM2MwNjQKICAgIFRSQU5TQUNUSU9OX0lE
PTI0NDk3NDk4MDAKICAgIF9TT1VSQ0VfUkVBTFRJTUVfVElNRVNUQU1QPTE1NzUwMzQzNTMx
NTUzNDYKRnJpIDIwMTktMTEtMjkgMTM6MzI6MzMuMTc4NTU0IFVUQyBbcz1hYTJmMTkzMWJm
M2E0OGY3OTZjY2ZkY2M5YmZkZDIzOTtpPTQzMjtiPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2Nl
MzFiOGU2ZGYwO209NjcxMDg0ZWI1O3Q9NTk4N2M0MzIxN2NiZjt4PWE0ZmQ5NjdkNjE2YjI3
M2JdCiAgICBTWVNMT0dfRkFDSUxJVFk9MwogICAgU1lTTE9HX0lERU5USUZJRVI9c3lzdGVt
ZAogICAgX1RSQU5TUE9SVD1qb3VybmFsCiAgICBfUElEPTEKICAgIF9VSUQ9MAogICAgX0dJ
RD0wCiAgICBfQ09NTT1zeXN0ZW1kCiAgICBfRVhFPS9saWIvc3lzdGVtZC9zeXN0ZW1kCiAg
ICBfQ01ETElORT0vc2Jpbi9pbml0CiAgICBfQ0FQX0VGRkVDVElWRT0zZmZmZmZmZmZmCiAg
ICBfU1lTVEVNRF9DR1JPVVA9L2luaXQuc2NvcGUKICAgIF9TWVNURU1EX1VOSVQ9aW5pdC5z
Y29wZQogICAgX1NZU1RFTURfU0xJQ0U9LS5zbGljZQogICAgX0JPT1RfSUQ9Yzc5N2M3OTI1
YWFiNDMwNDhjOWM3Y2UzMWI4ZTZkZjAKICAgIF9NQUNISU5FX0lEPTM2YTcxNzY1YTZiNjQz
NjliY2YxMWNhNGNjNjE4MWY0CiAgICBfSE9TVE5BTUU9bmVwdHVuMgogICAgUFJJT1JJVFk9
NAogICAgVU5JVD14eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuc2VydmljZQogICAgQ09E
RV9GSUxFPXNyYy9jb3JlL3VuaXQuYwogICAgQ09ERV9MSU5FPTU3OTcKICAgIENPREVfRlVO
Qz11bml0X2xvZ19wcm9jZXNzX2V4aXQKICAgIE1FU1NBR0VfSUQ9OThlMzIyMjAzZjdhNGVk
MjkwZDA5ZmUwM2MwOWZlMTUKICAgIEVYSVRfQ09ERT1raWxsZWQKICAgIEVYSVRfU1RBVFVT
PTYKICAgIENPTU1BTkQ9RXhlY1N0YXJ0CiAgICBNRVNTQUdFPXh5ei5vcGVuYm1jX3Byb2pl
Y3QuTmV0d29yay5zZXJ2aWNlOiBNYWluIHByb2Nlc3MgZXhpdGVkLCBjb2RlPWtpbGxlZCwg
c3RhdHVzPTYvQUJSVAogICAgSU5WT0NBVElPTl9JRD1iNWNmMTJkODFiYTg0NGU0OGMyZDFh
NTlhMjIzYzA2NAogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM1MzE3
ODU1NApGcmkgMjAxOS0xMS0yOSAxMzozMjozMy4xODA2MzEgVVRDIFtzPWFhMmYxOTMxYmYz
YTQ4Zjc5NmNjZmRjYzliZmRkMjM5O2k9NDMzO2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2Uz
MWI4ZTZkZjA7bT02NzEwODczN2Y7dD01OTg3YzQzMjFhMTg5O3g9ZDM3NmI5NmYwYjJiNmQ0
OF0KICAgIFNZU0xPR19GQUNJTElUWT0zCiAgICBTWVNMT0dfSURFTlRJRklFUj1zeXN0ZW1k
CiAgICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9QSUQ9MQogICAgX1VJRD0wCiAgICBfR0lE
PTAKICAgIF9DT01NPXN5c3RlbWQKICAgIF9FWEU9L2xpYi9zeXN0ZW1kL3N5c3RlbWQKICAg
IF9DTURMSU5FPS9zYmluL2luaXQKICAgIF9DQVBfRUZGRUNUSVZFPTNmZmZmZmZmZmYKICAg
IF9TWVNURU1EX0NHUk9VUD0vaW5pdC5zY29wZQogICAgX1NZU1RFTURfVU5JVD1pbml0LnNj
b3BlCiAgICBfU1lTVEVNRF9TTElDRT0tLnNsaWNlCiAgICBfQk9PVF9JRD1jNzk3Yzc5MjVh
YWI0MzA0OGM5YzdjZTMxYjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZhNzE3NjVhNmI2NDM2
OWJjZjExY2E0Y2M2MTgxZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAgICBQUklPUklUWT00
CiAgICBVTklUPXh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5zZXJ2aWNlCiAgICBDT0RF
X0ZJTEU9c3JjL2NvcmUvdW5pdC5jCiAgICBDT0RFX0xJTkU9NTc1MwogICAgQ09ERV9GVU5D
PXVuaXRfbG9nX2ZhaWx1cmUKICAgIE1FU1NBR0VfSUQ9ZDliMzczZWQ1NWE2NGZlYjgyNDJl
MDJkYmU3OWE0OWMKICAgIFVOSVRfUkVTVUxUPXNpZ25hbAogICAgTUVTU0FHRT14eXoub3Bl
bmJtY19wcm9qZWN0Lk5ldHdvcmsuc2VydmljZTogRmFpbGVkIHdpdGggcmVzdWx0ICdzaWdu
YWwnLgogICAgSU5WT0NBVElPTl9JRD1iNWNmMTJkODFiYTg0NGU0OGMyZDFhNTlhMjIzYzA2
NAogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM1MzE4MDYzMQpGcmkg
MjAxOS0xMS0yOSAxMzozMjozNC4zMDY5MzAgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5NmNj
ZmRjYzliZmRkMjM5O2k9NDM0O2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZkZjA7
bT02NzExOTYxYzE7dD01OTg3YzQzMzI4ZmM0O3g9NmNiYTU4Yzk4M2UwOWU0N10KICAgIFBS
SU9SSVRZPTYKICAgIFNZU0xPR19GQUNJTElUWT0zCiAgICBTWVNMT0dfSURFTlRJRklFUj1z
eXN0ZW1kCiAgICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9QSUQ9MQogICAgX1VJRD0wCiAg
ICBfR0lEPTAKICAgIF9DT01NPXN5c3RlbWQKICAgIF9FWEU9L2xpYi9zeXN0ZW1kL3N5c3Rl
bWQKICAgIF9DTURMSU5FPS9zYmluL2luaXQKICAgIF9DQVBfRUZGRUNUSVZFPTNmZmZmZmZm
ZmYKICAgIF9TWVNURU1EX0NHUk9VUD0vaW5pdC5zY29wZQogICAgX1NZU1RFTURfVU5JVD1p
bml0LnNjb3BlCiAgICBfU1lTVEVNRF9TTElDRT0tLnNsaWNlCiAgICBfQk9PVF9JRD1jNzk3
Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZhNzE3NjVh
NmI2NDM2OWJjZjExY2E0Y2M2MTgxZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAgICBVTklU
PXh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5zZXJ2aWNlCiAgICBDT0RFX0ZJTEU9c3Jj
L2NvcmUvc2VydmljZS5jCiAgICBDT0RFX0xJTkU9Mzc1MgogICAgQ09ERV9GVU5DPXNlcnZp
Y2VfZGlzcGF0Y2hfdGltZXIKICAgIE1FU1NBR0U9eHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3
b3JrLnNlcnZpY2U6IFNlcnZpY2UgUmVzdGFydFNlYz0xcyBleHBpcmVkLCBzY2hlZHVsaW5n
IHJlc3RhcnQuCiAgICBJTlZPQ0FUSU9OX0lEPWI1Y2YxMmQ4MWJhODQ0ZTQ4YzJkMWE1OWEy
MjNjMDY0CiAgICBfU09VUkNFX1JFQUxUSU1FX1RJTUVTVEFNUD0xNTc1MDM0MzU0MzA2OTMw
CkZyaSAyMDE5LTExLTI5IDEzOjMyOjM0LjMxNzQ4OSBVVEMgW3M9YWEyZjE5MzFiZjNhNDhm
Nzk2Y2NmZGNjOWJmZGQyMzk7aT00MzU7Yj1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhl
NmRmMDttPTY3MTE5OGIwNTt0PTU5ODdjNDMzMmI5MDg7eD1lOTM0YWQ3ZWE0OWZjM2FlXQog
ICAgUFJJT1JJVFk9NgogICAgU1lTTE9HX0ZBQ0lMSVRZPTMKICAgIFNZU0xPR19JREVOVElG
SUVSPXN5c3RlbWQKICAgIF9UUkFOU1BPUlQ9am91cm5hbAogICAgX1BJRD0xCiAgICBfVUlE
PTAKICAgIF9HSUQ9MAogICAgX0NPTU09c3lzdGVtZAogICAgX0VYRT0vbGliL3N5c3RlbWQv
c3lzdGVtZAogICAgX0NNRExJTkU9L3NiaW4vaW5pdAogICAgX0NBUF9FRkZFQ1RJVkU9M2Zm
ZmZmZmZmZgogICAgX1NZU1RFTURfQ0dST1VQPS9pbml0LnNjb3BlCiAgICBfU1lTVEVNRF9V
TklUPWluaXQuc2NvcGUKICAgIF9TWVNURU1EX1NMSUNFPS0uc2xpY2UKICAgIF9CT09UX0lE
PWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3
MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAg
IFVOSVQ9eHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLnNlcnZpY2UKICAgIENPREVfRklM
RT1zcmMvY29yZS9zZXJ2aWNlLmMKICAgIENPREVfTElORT0yMjc0CiAgICBDT0RFX0ZVTkM9
c2VydmljZV9lbnRlcl9yZXN0YXJ0CiAgICBNRVNTQUdFX0lEPTVlYjAzNDk0YjY1ODQ4NzBh
NTM2YjMzNzI5MDgwOWIzCiAgICBNRVNTQUdFPXh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29y
ay5zZXJ2aWNlOiBTY2hlZHVsZWQgcmVzdGFydCBqb2IsIHJlc3RhcnQgY291bnRlciBpcyBh
dCAzLgogICAgTl9SRVNUQVJUUz0zCiAgICBJTlZPQ0FUSU9OX0lEPWI1Y2YxMmQ4MWJhODQ0
ZTQ4YzJkMWE1OWEyMjNjMDY0CiAgICBfU09VUkNFX1JFQUxUSU1FX1RJTUVTVEFNUD0xNTc1
MDM0MzU0MzE3NDg5CkZyaSAyMDE5LTExLTI5IDEzOjMyOjM0LjMzMDI5MiBVVEMgW3M9YWEy
ZjE5MzFiZjNhNDhmNzk2Y2NmZGNjOWJmZGQyMzk7aT00MzY7Yj1jNzk3Yzc5MjVhYWI0MzA0
OGM5YzdjZTMxYjhlNmRmMDttPTY3MTE5YmQwNzt0PTU5ODdjNDMzMmViMGE7eD1jODBmMTIw
NDZkN2RmMjliXQogICAgUFJJT1JJVFk9NgogICAgU1lTTE9HX0ZBQ0lMSVRZPTMKICAgIENP
REVfRklMRT1zcmMvY29yZS9qb2IuYwogICAgQ09ERV9MSU5FPTkyNAogICAgQ09ERV9GVU5D
PWpvYl9sb2dfZG9uZV9zdGF0dXNfbWVzc2FnZQogICAgU1lTTE9HX0lERU5USUZJRVI9c3lz
dGVtZAogICAgSk9CX1JFU1VMVD1kb25lCiAgICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9Q
SUQ9MQogICAgX1VJRD0wCiAgICBfR0lEPTAKICAgIF9DT01NPXN5c3RlbWQKICAgIF9FWEU9
L2xpYi9zeXN0ZW1kL3N5c3RlbWQKICAgIF9DTURMSU5FPS9zYmluL2luaXQKICAgIF9DQVBf
RUZGRUNUSVZFPTNmZmZmZmZmZmYKICAgIF9TWVNURU1EX0NHUk9VUD0vaW5pdC5zY29wZQog
ICAgX1NZU1RFTURfVU5JVD1pbml0LnNjb3BlCiAgICBfU1lTVEVNRF9TTElDRT0tLnNsaWNl
CiAgICBfQk9PVF9JRD1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMAogICAgX01B
Q0hJTkVfSUQ9MzZhNzE3NjVhNmI2NDM2OWJjZjExY2E0Y2M2MTgxZjQKICAgIF9IT1NUTkFN
RT1uZXB0dW4yCiAgICBVTklUPXh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5zZXJ2aWNl
CiAgICBKT0JfVFlQRT1yZXN0YXJ0CiAgICBNRVNTQUdFX0lEPTlkMWFhYTI3ZDYwMTQwYmQ5
NjM2NTQzOGFhZDIwMjg2CiAgICBNRVNTQUdFPVN0b3BwZWQgUGhvc3Bob3IgTmV0d29yayBN
YW5hZ2VyLgogICAgSU5WT0NBVElPTl9JRD1iNWNmMTJkODFiYTg0NGU0OGMyZDFhNTlhMjIz
YzA2NAogICAgSk9CX0lEPTMzNzkKICAgIF9TT1VSQ0VfUkVBTFRJTUVfVElNRVNUQU1QPTE1
NzUwMzQzNTQzMzAyOTIKRnJpIDIwMTktMTEtMjkgMTM6MzI6MzQuMzU3MTk1IFVUQyBbcz1h
YTJmMTkzMWJmM2E0OGY3OTZjY2ZkY2M5YmZkZDIzOTtpPTQzNztiPWM3OTdjNzkyNWFhYjQz
MDQ4YzljN2NlMzFiOGU2ZGYwO209NjcxMWEyNjIxO3Q9NTk4N2M0MzMzNTQyNDt4PWI4ZTdj
NTg2YzM3Y2EyZjBdCiAgICBQUklPUklUWT02CiAgICBTWVNMT0dfRkFDSUxJVFk9MwogICAg
Q09ERV9GSUxFPXNyYy9jb3JlL2pvYi5jCiAgICBTWVNMT0dfSURFTlRJRklFUj1zeXN0ZW1k
CiAgICBKT0JfVFlQRT1zdGFydAogICAgX1RSQU5TUE9SVD1qb3VybmFsCiAgICBfUElEPTEK
ICAgIF9VSUQ9MAogICAgX0dJRD0wCiAgICBfQ09NTT1zeXN0ZW1kCiAgICBfRVhFPS9saWIv
c3lzdGVtZC9zeXN0ZW1kCiAgICBfQ01ETElORT0vc2Jpbi9pbml0CiAgICBfQ0FQX0VGRkVD
VElWRT0zZmZmZmZmZmZmCiAgICBfU1lTVEVNRF9DR1JPVVA9L2luaXQuc2NvcGUKICAgIF9T
WVNURU1EX1VOSVQ9aW5pdC5zY29wZQogICAgX1NZU1RFTURfU0xJQ0U9LS5zbGljZQogICAg
X0JPT1RfSUQ9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZkZjAKICAgIF9NQUNISU5F
X0lEPTM2YTcxNzY1YTZiNjQzNjliY2YxMWNhNGNjNjE4MWY0CiAgICBfSE9TVE5BTUU9bmVw
dHVuMgogICAgQ09ERV9MSU5FPTU3NAogICAgQ09ERV9GVU5DPWpvYl9sb2dfYmVnaW5fc3Rh
dHVzX21lc3NhZ2UKICAgIE1FU1NBR0VfSUQ9N2Q0OTU4ZTg0MmRhNGE3NThmNmMxY2RjN2Iz
NmRjYzUKICAgIE1FU1NBR0U9U3RhcnRpbmcgUGhvc3Bob3IgTmV0d29yayBNYW5hZ2VyLi4u
CiAgICBVTklUPXh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5zZXJ2aWNlCiAgICBKT0Jf
SUQ9MzM3OQogICAgSU5WT0NBVElPTl9JRD01YTQ2MmFlYzQwMDc0NmJiYmFiODAyMTc2ZTEx
ZTAzYgogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM1NDM1NzE5NQpG
cmkgMjAxOS0xMS0yOSAxMzozMjozNC40NjExODAgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5
NmNjZmRjYzliZmRkMjM5O2k9NDM4O2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZk
ZjA7bT02NzExYmM5NDc7dD01OTg3YzQzMzRmNzQ5O3g9ZWVkY2Y3NGU4NzBjMmQ3Y10KICAg
IFBSSU9SSVRZPTYKICAgIFNZU0xPR19GQUNJTElUWT0zCiAgICBDT0RFX0ZJTEU9c3JjL2Nv
cmUvam9iLmMKICAgIENPREVfTElORT05MjQKICAgIENPREVfRlVOQz1qb2JfbG9nX2RvbmVf
c3RhdHVzX21lc3NhZ2UKICAgIFNZU0xPR19JREVOVElGSUVSPXN5c3RlbWQKICAgIEpPQl9U
WVBFPXN0YXJ0CiAgICBKT0JfUkVTVUxUPWRvbmUKICAgIE1FU1NBR0VfSUQ9MzlmNTM0Nzlk
M2EwNDVhYzhlMTE3ODYyNDgyMzFmYmYKICAgIF9UUkFOU1BPUlQ9am91cm5hbAogICAgX1BJ
RD0xCiAgICBfVUlEPTAKICAgIF9HSUQ9MAogICAgX0NPTU09c3lzdGVtZAogICAgX0VYRT0v
bGliL3N5c3RlbWQvc3lzdGVtZAogICAgX0NNRExJTkU9L3NiaW4vaW5pdAogICAgX0NBUF9F
RkZFQ1RJVkU9M2ZmZmZmZmZmZgogICAgX1NZU1RFTURfQ0dST1VQPS9pbml0LnNjb3BlCiAg
ICBfU1lTVEVNRF9VTklUPWluaXQuc2NvcGUKICAgIF9TWVNURU1EX1NMSUNFPS0uc2xpY2UK
ICAgIF9CT09UX0lEPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBfTUFD
SElORV9JRD0zNmE3MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1ROQU1F
PW5lcHR1bjIKICAgIFVOSVQ9eHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLnNlcnZpY2UK
ICAgIE1FU1NBR0U9U3RhcnRlZCBQaG9zcGhvciBOZXR3b3JrIE1hbmFnZXIuCiAgICBKT0Jf
SUQ9MzM3OQogICAgSU5WT0NBVElPTl9JRD01YTQ2MmFlYzQwMDc0NmJiYmFiODAyMTc2ZTEx
ZTAzYgogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM1NDQ2MTE4MApG
cmkgMjAxOS0xMS0yOSAxMzozMjozNy41ODUzODMgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5
NmNjZmRjYzliZmRkMjM5O2k9NDM5O2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZk
ZjA7bT02NzE0YjY4M2M7dD01OTg3YzQzNjQ5NjNlO3g9YTU1ZWRiNjVhNGIxYmRlMF0KICAg
IFBSSU9SSVRZPTYKICAgIFNZU0xPR19GQUNJTElUWT0zCiAgICBDT0RFX0ZJTEU9c3JjL2Nv
cmUvam9iLmMKICAgIFNZU0xPR19JREVOVElGSUVSPXN5c3RlbWQKICAgIF9UUkFOU1BPUlQ9
am91cm5hbAogICAgX1BJRD0xCiAgICBfVUlEPTAKICAgIF9HSUQ9MAogICAgX0NPTU09c3lz
dGVtZAogICAgX0VYRT0vbGliL3N5c3RlbWQvc3lzdGVtZAogICAgX0NNRExJTkU9L3NiaW4v
aW5pdAogICAgX0NBUF9FRkZFQ1RJVkU9M2ZmZmZmZmZmZgogICAgX1NZU1RFTURfQ0dST1VQ
PS9pbml0LnNjb3BlCiAgICBfU1lTVEVNRF9VTklUPWluaXQuc2NvcGUKICAgIF9TWVNURU1E
X1NMSUNFPS0uc2xpY2UKICAgIF9CT09UX0lEPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFi
OGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFm
NAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAgIFVOSVQ9c3lzdGVtZC1uZXR3b3JrZC5zZXJ2
aWNlCiAgICBDT0RFX0xJTkU9NTc0CiAgICBDT0RFX0ZVTkM9am9iX2xvZ19iZWdpbl9zdGF0
dXNfbWVzc2FnZQogICAgTUVTU0FHRT1TdG9wcGluZyBOZXR3b3JrIFNlcnZpY2UuLi4KICAg
IEpPQl9UWVBFPXN0b3AKICAgIE1FU1NBR0VfSUQ9ZGU1YjQyNmE2M2JlNDdhN2I2YWMzZWFh
YzgyZTJmNmYKICAgIElOVk9DQVRJT05fSUQ9NTExMmE2MTkyNjRiNDEzZGI2OTM3NzlmNDgy
MDYyMDUKICAgIEpPQl9JRD0zNDI4CiAgICBfU09VUkNFX1JFQUxUSU1FX1RJTUVTVEFNUD0x
NTc1MDM0MzU3NTg1MzgzCkZyaSAyMDE5LTExLTI5IDEzOjMyOjM3LjY1NDc1MSBVVEMgW3M9
YWEyZjE5MzFiZjNhNDhmNzk2Y2NmZGNjOWJmZGQyMzk7aT00M2E7Yj1jNzk3Yzc5MjVhYWI0
MzA0OGM5YzdjZTMxYjhlNmRmMDttPTY3MTRjNzczMzt0PTU5ODdjNDM2NWE1MzY7eD1jYWYw
MmM5M2I3MDk2YzgxXQogICAgUFJJT1JJVFk9NgogICAgU1lTTE9HX0ZBQ0lMSVRZPTMKICAg
IFNZU0xPR19JREVOVElGSUVSPXN5c3RlbWQKICAgIF9UUkFOU1BPUlQ9am91cm5hbAogICAg
X1BJRD0xCiAgICBfVUlEPTAKICAgIF9HSUQ9MAogICAgX0NPTU09c3lzdGVtZAogICAgX0VY
RT0vbGliL3N5c3RlbWQvc3lzdGVtZAogICAgX0NNRExJTkU9L3NiaW4vaW5pdAogICAgX0NB
UF9FRkZFQ1RJVkU9M2ZmZmZmZmZmZgogICAgX1NZU1RFTURfQ0dST1VQPS9pbml0LnNjb3Bl
CiAgICBfU1lTVEVNRF9VTklUPWluaXQuc2NvcGUKICAgIF9TWVNURU1EX1NMSUNFPS0uc2xp
Y2UKICAgIF9CT09UX0lEPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBf
TUFDSElORV9JRD0zNmE3MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1RO
QU1FPW5lcHR1bjIKICAgIFVOSVQ9c3lzdGVtZC1uZXR3b3JrZC5zZXJ2aWNlCiAgICBDT0RF
X0ZJTEU9c3JjL2NvcmUvdW5pdC5jCiAgICBDT0RFX0xJTkU9NTc0MgogICAgQ09ERV9GVU5D
PXVuaXRfbG9nX3N1Y2Nlc3MKICAgIE1FU1NBR0VfSUQ9N2FkMmQxODlmN2U5NGU3MGEzOGM3
ODEzNTQ5MTI0NDgKICAgIE1FU1NBR0U9c3lzdGVtZC1uZXR3b3JrZC5zZXJ2aWNlOiBTdWNj
ZWVkZWQuCiAgICBJTlZPQ0FUSU9OX0lEPTUxMTJhNjE5MjY0YjQxM2RiNjkzNzc5ZjQ4MjA2
MjA1CiAgICBfU09VUkNFX1JFQUxUSU1FX1RJTUVTVEFNUD0xNTc1MDM0MzU3NjU0NzUxCkZy
aSAyMDE5LTExLTI5IDEzOjMyOjM3LjY2NzUzOSBVVEMgW3M9YWEyZjE5MzFiZjNhNDhmNzk2
Y2NmZGNjOWJmZGQyMzk7aT00M2I7Yj1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRm
MDttPTY3MTRjYTkzMDt0PTU5ODdjNDM2NWQ3MzE7eD1lNWFmM2Y4MDBkZjZhYzdjXQogICAg
UFJJT1JJVFk9NgogICAgU1lTTE9HX0ZBQ0lMSVRZPTMKICAgIENPREVfRklMRT1zcmMvY29y
ZS9qb2IuYwogICAgQ09ERV9MSU5FPTkyNAogICAgQ09ERV9GVU5DPWpvYl9sb2dfZG9uZV9z
dGF0dXNfbWVzc2FnZQogICAgU1lTTE9HX0lERU5USUZJRVI9c3lzdGVtZAogICAgSk9CX1JF
U1VMVD1kb25lCiAgICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9QSUQ9MQogICAgX1VJRD0w
CiAgICBfR0lEPTAKICAgIF9DT01NPXN5c3RlbWQKICAgIF9FWEU9L2xpYi9zeXN0ZW1kL3N5
c3RlbWQKICAgIF9DTURMSU5FPS9zYmluL2luaXQKICAgIF9DQVBfRUZGRUNUSVZFPTNmZmZm
ZmZmZmYKICAgIF9TWVNURU1EX0NHUk9VUD0vaW5pdC5zY29wZQogICAgX1NZU1RFTURfVU5J
VD1pbml0LnNjb3BlCiAgICBfU1lTVEVNRF9TTElDRT0tLnNsaWNlCiAgICBfQk9PVF9JRD1j
Nzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZhNzE3
NjVhNmI2NDM2OWJjZjExY2E0Y2M2MTgxZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAgICBV
TklUPXN5c3RlbWQtbmV0d29ya2Quc2VydmljZQogICAgSk9CX1RZUEU9cmVzdGFydAogICAg
TUVTU0FHRV9JRD05ZDFhYWEyN2Q2MDE0MGJkOTYzNjU0MzhhYWQyMDI4NgogICAgTUVTU0FH
RT1TdG9wcGVkIE5ldHdvcmsgU2VydmljZS4KICAgIElOVk9DQVRJT05fSUQ9NTExMmE2MTky
NjRiNDEzZGI2OTM3NzlmNDgyMDYyMDUKICAgIEpPQl9JRD0zNDI4CiAgICBfU09VUkNFX1JF
QUxUSU1FX1RJTUVTVEFNUD0xNTc1MDM0MzU3NjY3NTM5CkZyaSAyMDE5LTExLTI5IDEzOjMy
OjM3Ljc1MTI1MCBVVEMgW3M9YWEyZjE5MzFiZjNhNDhmNzk2Y2NmZGNjOWJmZGQyMzk7aT00
M2M7Yj1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMDttPTY3MTRkZjAyODt0PTU5
ODdjNDM2NzFlMmI7eD04NTE5NzQwNjkwMjcwNTIzXQogICAgUFJJT1JJVFk9NgogICAgU1lT
TE9HX0ZBQ0lMSVRZPTMKICAgIENPREVfRklMRT1zcmMvY29yZS9qb2IuYwogICAgU1lTTE9H
X0lERU5USUZJRVI9c3lzdGVtZAogICAgSk9CX1RZUEU9c3RhcnQKICAgIF9UUkFOU1BPUlQ9
am91cm5hbAogICAgX1BJRD0xCiAgICBfVUlEPTAKICAgIF9HSUQ9MAogICAgX0NPTU09c3lz
dGVtZAogICAgX0VYRT0vbGliL3N5c3RlbWQvc3lzdGVtZAogICAgX0NNRExJTkU9L3NiaW4v
aW5pdAogICAgX0NBUF9FRkZFQ1RJVkU9M2ZmZmZmZmZmZgogICAgX1NZU1RFTURfQ0dST1VQ
PS9pbml0LnNjb3BlCiAgICBfU1lTVEVNRF9VTklUPWluaXQuc2NvcGUKICAgIF9TWVNURU1E
X1NMSUNFPS0uc2xpY2UKICAgIF9CT09UX0lEPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFi
OGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFm
NAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAgIFVOSVQ9c3lzdGVtZC1uZXR3b3JrZC5zZXJ2
aWNlCiAgICBDT0RFX0xJTkU9NTc0CiAgICBDT0RFX0ZVTkM9am9iX2xvZ19iZWdpbl9zdGF0
dXNfbWVzc2FnZQogICAgTUVTU0FHRV9JRD03ZDQ5NThlODQyZGE0YTc1OGY2YzFjZGM3YjM2
ZGNjNQogICAgTUVTU0FHRT1TdGFydGluZyBOZXR3b3JrIFNlcnZpY2UuLi4KICAgIEpPQl9J
RD0zNDI4CiAgICBJTlZPQ0FUSU9OX0lEPTc5Njg5ZjNiYjczMzQ1MTg4OTQxODZkOWEwMDU4
YjI2CiAgICBfU09VUkNFX1JFQUxUSU1FX1RJTUVTVEFNUD0xNTc1MDM0MzU3NzUxMjUwCkZy
aSAyMDE5LTExLTI5IDEzOjMyOjM3Ljc3MjM2NSBVVEMgW3M9YWEyZjE5MzFiZjNhNDhmNzk2
Y2NmZGNjOWJmZGQyMzk7aT00M2Q7Yj1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRm
MDttPTY3MTRlNDJhYTt0PTU5ODdjNDM2NzcwYWM7eD1hMTQxYTYxODYxZWYzNjlhXQogICAg
U1lTTE9HX0ZBQ0lMSVRZPTMKICAgIF9VSUQ9MAogICAgX0dJRD0wCiAgICBfQ0FQX0VGRkVD
VElWRT0zZmZmZmZmZmZmCiAgICBfQk9PVF9JRD1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMx
YjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZhNzE3NjVhNmI2NDM2OWJjZjExY2E0Y2M2MTgx
ZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAgICBfU1lTVEVNRF9TTElDRT1zeXN0ZW0uc2xp
Y2UKICAgIFBSSU9SSVRZPTQKICAgIF9UUkFOU1BPUlQ9c3lzbG9nCiAgICBTWVNMT0dfSURF
TlRJRklFUj1uc2xjZAogICAgU1lTTE9HX1BJRD0yMTIKICAgIF9QSUQ9MjEyCiAgICBfQ09N
TT1uc2xjZAogICAgX0VYRT0vdXNyL3NiaW4vbnNsY2QKICAgIF9DTURMSU5FPS91c3Ivc2Jp
bi9uc2xjZAogICAgX1NZU1RFTURfQ0dST1VQPS9zeXN0ZW0uc2xpY2UvbnNsY2Quc2Vydmlj
ZQogICAgX1NZU1RFTURfVU5JVD1uc2xjZC5zZXJ2aWNlCiAgICBfU1lTVEVNRF9JTlZPQ0FU
SU9OX0lEPWI0ZDJhZTU5YTI1MjQ2Y2JhNGZiNmI0MzcwMzRlZjZlCiAgICBTWVNMT0dfVElN
RVNUQU1QPU5vdiAyOSAxMzozMjozNyAKICAgIE1FU1NBR0U9WzUyMjU1YV0gPGdyb3VwL21l
bWJlcj0ic3lzdGVtZC1uZXR3b3JrIj4gZmFpbGVkIHRvIGJpbmQgdG8gTERBUCBzZXJ2ZXIg
bGRhcDovLzEyNy4wLjAuMS86IENhbid0IGNvbnRhY3QgTERBUCBzZXJ2ZXI6IFRyYW5zcG9y
dCBlbmRwb2ludCBpcyBub3QgY29ubmVjdGVkCiAgICBfU09VUkNFX1JFQUxUSU1FX1RJTUVT
VEFNUD0xNTc1MDM0MzU3NzcyMzY1CkZyaSAyMDE5LTExLTI5IDEzOjMyOjM3Ljc3NTA2NSBV
VEMgW3M9YWEyZjE5MzFiZjNhNDhmNzk2Y2NmZGNjOWJmZGQyMzk7aT00M2U7Yj1jNzk3Yzc5
MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMDttPTY3MTRlN2NkODt0PTU5ODdjNDM2N2FhZTE7
eD04NmU5MmVmY2QzYTk3YmE0XQogICAgU1lTTE9HX0ZBQ0lMSVRZPTMKICAgIF9VSUQ9MAog
ICAgX0dJRD0wCiAgICBfQ0FQX0VGRkVDVElWRT0zZmZmZmZmZmZmCiAgICBfQk9PVF9JRD1j
Nzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZhNzE3
NjVhNmI2NDM2OWJjZjExY2E0Y2M2MTgxZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAgICBf
U1lTVEVNRF9TTElDRT1zeXN0ZW0uc2xpY2UKICAgIFBSSU9SSVRZPTMKICAgIF9UUkFOU1BP
UlQ9c3lzbG9nCiAgICBTWVNMT0dfSURFTlRJRklFUj1uc2xjZAogICAgU1lTTE9HX1BJRD0y
MTIKICAgIF9QSUQ9MjEyCiAgICBfQ09NTT1uc2xjZAogICAgX0VYRT0vdXNyL3NiaW4vbnNs
Y2QKICAgIF9DTURMSU5FPS91c3Ivc2Jpbi9uc2xjZAogICAgX1NZU1RFTURfQ0dST1VQPS9z
eXN0ZW0uc2xpY2UvbnNsY2Quc2VydmljZQogICAgX1NZU1RFTURfVU5JVD1uc2xjZC5zZXJ2
aWNlCiAgICBfU1lTVEVNRF9JTlZPQ0FUSU9OX0lEPWI0ZDJhZTU5YTI1MjQ2Y2JhNGZiNmI0
MzcwMzRlZjZlCiAgICBTWVNMT0dfVElNRVNUQU1QPU5vdiAyOSAxMzozMjozNyAKICAgIE1F
U1NBR0U9WzUyMjU1YV0gPGdyb3VwL21lbWJlcj0ic3lzdGVtZC1uZXR3b3JrIj4gbm8gYXZh
aWxhYmxlIExEQVAgc2VydmVyIGZvdW5kOiBDYW4ndCBjb250YWN0IExEQVAgc2VydmVyOiBU
cmFuc3BvcnQgZW5kcG9pbnQgaXMgbm90IGNvbm5lY3RlZAogICAgX1NPVVJDRV9SRUFMVElN
RV9USU1FU1RBTVA9MTU3NTAzNDM1Nzc3NTA2NQpGcmkgMjAxOS0xMS0yOSAxMzozMjozNy43
NzUzOTUgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5NmNjZmRjYzliZmRkMjM5O2k9NDNmO2I9
Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZkZjA7bT02NzE0ZTllNjU7dD01OTg3YzQz
NjdjYzZlO3g9NjNiODM0NTdiYTU2ZjBmZl0KICAgIFNZU0xPR19GQUNJTElUWT0zCiAgICBf
VUlEPTAKICAgIF9HSUQ9MAogICAgX0NBUF9FRkZFQ1RJVkU9M2ZmZmZmZmZmZgogICAgX0JP
T1RfSUQ9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZkZjAKICAgIF9NQUNISU5FX0lE
PTM2YTcxNzY1YTZiNjQzNjliY2YxMWNhNGNjNjE4MWY0CiAgICBfSE9TVE5BTUU9bmVwdHVu
MgogICAgX1NZU1RFTURfU0xJQ0U9c3lzdGVtLnNsaWNlCiAgICBQUklPUklUWT0zCiAgICBf
VFJBTlNQT1JUPXN5c2xvZwogICAgU1lTTE9HX0lERU5USUZJRVI9bnNsY2QKICAgIFNZU0xP
R19QSUQ9MjEyCiAgICBfUElEPTIxMgogICAgX0NPTU09bnNsY2QKICAgIF9FWEU9L3Vzci9z
YmluL25zbGNkCiAgICBfQ01ETElORT0vdXNyL3NiaW4vbnNsY2QKICAgIF9TWVNURU1EX0NH
Uk9VUD0vc3lzdGVtLnNsaWNlL25zbGNkLnNlcnZpY2UKICAgIF9TWVNURU1EX1VOSVQ9bnNs
Y2Quc2VydmljZQogICAgX1NZU1RFTURfSU5WT0NBVElPTl9JRD1iNGQyYWU1OWEyNTI0NmNi
YTRmYjZiNDM3MDM0ZWY2ZQogICAgU1lTTE9HX1RJTUVTVEFNUD1Ob3YgMjkgMTM6MzI6Mzcg
CiAgICBNRVNTQUdFPVs1MjI1NWFdIDxncm91cC9tZW1iZXI9InN5c3RlbWQtbmV0d29yayI+
IG5vIGF2YWlsYWJsZSBMREFQIHNlcnZlciBmb3VuZDogU2VydmVyIGlzIHVuYXZhaWxhYmxl
OiBUcmFuc3BvcnQgZW5kcG9pbnQgaXMgbm90IGNvbm5lY3RlZAogICAgX1NPVVJDRV9SRUFM
VElNRV9USU1FU1RBTVA9MTU3NTAzNDM1Nzc3NTM5NQpGcmkgMjAxOS0xMS0yOSAxMzozMjoz
OC43MDA1NjYgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5NmNjZmRjYzliZmRkMjM5O2k9NDQw
O2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZkZjA7bT02NzE1YzZjNzQ7dD01OTg3
YzQzNzU5YTc3O3g9NWNlNTFiZTAxMmJjYjJiZF0KICAgIFBSSU9SSVRZPTYKICAgIFNZU0xP
R19GQUNJTElUWT0zCiAgICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9CT09UX0lEPWM3OTdj
NzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2
YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAgIF9TWVNU
RU1EX1NMSUNFPXN5c3RlbS5zbGljZQogICAgU1lTTE9HX0lERU5USUZJRVI9c3lzdGVtZC1u
ZXR3b3JrZAogICAgX1VJRD05OTYKICAgIF9HSUQ9OTk1CiAgICBfQ09NTT1zeXN0ZW1kLW5l
dHdvcmsKICAgIF9FWEU9L3Jvb3QvbGliL3N5c3RlbWQvc3lzdGVtZC1uZXR3b3JrZAogICAg
X0NNRExJTkU9L2xpYi9zeXN0ZW1kL3N5c3RlbWQtbmV0d29ya2QKICAgIF9DQVBfRUZGRUNU
SVZFPTNjMDAKICAgIF9TWVNURU1EX0NHUk9VUD0vc3lzdGVtLnNsaWNlL3N5c3RlbWQtbmV0
d29ya2Quc2VydmljZQogICAgX1NZU1RFTURfVU5JVD1zeXN0ZW1kLW5ldHdvcmtkLnNlcnZp
Y2UKICAgIENPREVfRklMRT1zcmMvbmV0d29yay9uZXR3b3JrZC1saW5rLmMKICAgIElOVEVS
RkFDRT1ldGgwCiAgICBDT0RFX0xJTkU9MzE2NAogICAgQ09ERV9GVU5DPWxpbmtfaXB2Nmxs
X2dhaW5lZAogICAgTUVTU0FHRT1ldGgwOiBHYWluZWQgSVB2NkxMCiAgICBfUElEPTU0Ngog
ICAgX1NZU1RFTURfSU5WT0NBVElPTl9JRD03OTY4OWYzYmI3MzM0NTE4ODk0MTg2ZDlhMDA1
OGIyNgogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM1ODcwMDU2NgpG
cmkgMjAxOS0xMS0yOSAxMzozMjozOC43NTM2MzEgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5
NmNjZmRjYzliZmRkMjM5O2k9NDQxO2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZk
ZjA7bT02NzE1ZDNiYjg7dD01OTg3YzQzNzY2OWJiO3g9YTE3ZjM0NmIwYjRiYWNmYV0KICAg
IFBSSU9SSVRZPTYKICAgIFNZU0xPR19GQUNJTElUWT0zCiAgICBfVFJBTlNQT1JUPWpvdXJu
YWwKICAgIF9CT09UX0lEPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBf
TUFDSElORV9JRD0zNmE3MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1RO
QU1FPW5lcHR1bjIKICAgIF9TWVNURU1EX1NMSUNFPXN5c3RlbS5zbGljZQogICAgQ09ERV9G
SUxFPXNyYy9uZXR3b3JrL25ldHdvcmtkLmMKICAgIENPREVfTElORT0xMTQKICAgIENPREVf
RlVOQz1ydW4KICAgIFNZU0xPR19JREVOVElGSUVSPXN5c3RlbWQtbmV0d29ya2QKICAgIE1F
U1NBR0U9RW51bWVyYXRpb24gY29tcGxldGVkCiAgICBfVUlEPTk5NgogICAgX0dJRD05OTUK
ICAgIF9DT01NPXN5c3RlbWQtbmV0d29yawogICAgX0VYRT0vcm9vdC9saWIvc3lzdGVtZC9z
eXN0ZW1kLW5ldHdvcmtkCiAgICBfQ01ETElORT0vbGliL3N5c3RlbWQvc3lzdGVtZC1uZXR3
b3JrZAogICAgX0NBUF9FRkZFQ1RJVkU9M2MwMAogICAgX1NZU1RFTURfQ0dST1VQPS9zeXN0
ZW0uc2xpY2Uvc3lzdGVtZC1uZXR3b3JrZC5zZXJ2aWNlCiAgICBfU1lTVEVNRF9VTklUPXN5
c3RlbWQtbmV0d29ya2Quc2VydmljZQogICAgX1BJRD01NDYKICAgIF9TWVNURU1EX0lOVk9D
QVRJT05fSUQ9Nzk2ODlmM2JiNzMzNDUxODg5NDE4NmQ5YTAwNThiMjYKICAgIF9TT1VSQ0Vf
UkVBTFRJTUVfVElNRVNUQU1QPTE1NzUwMzQzNTg3NTM2MzEKRnJpIDIwMTktMTEtMjkgMTM6
MzI6MzguNzU4NDEzIFVUQyBbcz1hYTJmMTkzMWJmM2E0OGY3OTZjY2ZkY2M5YmZkZDIzOTtp
PTQ0MjtiPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwO209NjcxNWQ1N2NhO3Q9
NTk4N2M0Mzc2ODVjZDt4PWY1Zjc2ODg4NjA0NDY5NTldCiAgICBQUklPUklUWT02CiAgICBT
WVNMT0dfRkFDSUxJVFk9MwogICAgQ09ERV9GSUxFPXNyYy9jb3JlL2pvYi5jCiAgICBDT0RF
X0xJTkU9OTI0CiAgICBDT0RFX0ZVTkM9am9iX2xvZ19kb25lX3N0YXR1c19tZXNzYWdlCiAg
ICBTWVNMT0dfSURFTlRJRklFUj1zeXN0ZW1kCiAgICBKT0JfVFlQRT1zdGFydAogICAgSk9C
X1JFU1VMVD1kb25lCiAgICBNRVNTQUdFX0lEPTM5ZjUzNDc5ZDNhMDQ1YWM4ZTExNzg2MjQ4
MjMxZmJmCiAgICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9QSUQ9MQogICAgX1VJRD0wCiAg
ICBfR0lEPTAKICAgIF9DT01NPXN5c3RlbWQKICAgIF9FWEU9L2xpYi9zeXN0ZW1kL3N5c3Rl
bWQKICAgIF9DTURMSU5FPS9zYmluL2luaXQKICAgIF9DQVBfRUZGRUNUSVZFPTNmZmZmZmZm
ZmYKICAgIF9TWVNURU1EX0NHUk9VUD0vaW5pdC5zY29wZQogICAgX1NZU1RFTURfVU5JVD1p
bml0LnNjb3BlCiAgICBfU1lTVEVNRF9TTElDRT0tLnNsaWNlCiAgICBfQk9PVF9JRD1jNzk3
Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZhNzE3NjVh
NmI2NDM2OWJjZjExY2E0Y2M2MTgxZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAgICBNRVNT
QUdFPVN0YXJ0ZWQgTmV0d29yayBTZXJ2aWNlLgogICAgVU5JVD1zeXN0ZW1kLW5ldHdvcmtk
LnNlcnZpY2UKICAgIEpPQl9JRD0zNDI4CiAgICBJTlZPQ0FUSU9OX0lEPTc5Njg5ZjNiYjcz
MzQ1MTg4OTQxODZkOWEwMDU4YjI2CiAgICBfU09VUkNFX1JFQUxUSU1FX1RJTUVTVEFNUD0x
NTc1MDM0MzU4NzU4NDEzCkZyaSAyMDE5LTExLTI5IDEzOjMyOjM4LjgxNjI3MCBVVEMgW3M9
YWEyZjE5MzFiZjNhNDhmNzk2Y2NmZGNjOWJmZGQyMzk7aT00NDM7Yj1jNzk3Yzc5MjVhYWI0
MzA0OGM5YzdjZTMxYjhlNmRmMDttPTY3MTVlMzA2NDt0PTU5ODdjNDM3NzVlNjg7eD1kZmMx
MDNmNTNmNTI4NDgwXQogICAgUFJJT1JJVFk9NgogICAgU1lTTE9HX0ZBQ0lMSVRZPTMKICAg
IF9UUkFOU1BPUlQ9am91cm5hbAogICAgX0JPT1RfSUQ9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3
Y2UzMWI4ZTZkZjAKICAgIF9NQUNISU5FX0lEPTM2YTcxNzY1YTZiNjQzNjliY2YxMWNhNGNj
NjE4MWY0CiAgICBfSE9TVE5BTUU9bmVwdHVuMgogICAgX1NZU1RFTURfU0xJQ0U9c3lzdGVt
LnNsaWNlCiAgICBTWVNMT0dfSURFTlRJRklFUj1zeXN0ZW1kLW5ldHdvcmtkCiAgICBfVUlE
PTk5NgogICAgX0dJRD05OTUKICAgIF9DT01NPXN5c3RlbWQtbmV0d29yawogICAgX0VYRT0v
cm9vdC9saWIvc3lzdGVtZC9zeXN0ZW1kLW5ldHdvcmtkCiAgICBfQ01ETElORT0vbGliL3N5
c3RlbWQvc3lzdGVtZC1uZXR3b3JrZAogICAgX0NBUF9FRkZFQ1RJVkU9M2MwMAogICAgX1NZ
U1RFTURfQ0dST1VQPS9zeXN0ZW0uc2xpY2Uvc3lzdGVtZC1uZXR3b3JrZC5zZXJ2aWNlCiAg
ICBfU1lTVEVNRF9VTklUPXN5c3RlbWQtbmV0d29ya2Quc2VydmljZQogICAgSU5URVJGQUNF
PWV0aDAKICAgIENPREVfRklMRT1zcmMvbmV0d29yay9uZXR3b3JrZC1tYW5hZ2VyLmMKICAg
IENPREVfTElORT04MTQKICAgIENPREVfRlVOQz1tYW5hZ2VyX3J0bmxfcHJvY2Vzc19hZGRy
ZXNzCiAgICBNRVNTQUdFPWV0aDA6IEtlcm5lbCByZW1vdmVkIGFuIGFkZHJlc3Mgd2UgZG9u
J3QgcmVtZW1iZXI6IDE2OS4yNTQuNi4yMTEvMTYgKHZhbGlkIGZvcmV2ZXIpLCBpZ25vcmlu
Zy4KICAgIF9QSUQ9NTQ2CiAgICBfU1lTVEVNRF9JTlZPQ0FUSU9OX0lEPTc5Njg5ZjNiYjcz
MzQ1MTg4OTQxODZkOWEwMDU4YjI2CiAgICBfU09VUkNFX1JFQUxUSU1FX1RJTUVTVEFNUD0x
NTc1MDM0MzU4ODE2MjcwCkZyaSAyMDE5LTExLTI5IDEzOjMyOjM4LjkwNzg3OCBVVEMgW3M9
YWEyZjE5MzFiZjNhNDhmNzk2Y2NmZGNjOWJmZGQyMzk7aT00NDQ7Yj1jNzk3Yzc5MjVhYWI0
MzA0OGM5YzdjZTMxYjhlNmRmMDttPTY3MTVmOTY0MDt0PTU5ODdjNDM3OGM0NDM7eD1hYjMz
Njk1MmFlMjc3OTRhXQogICAgUFJJT1JJVFk9NgogICAgU1lTTE9HX0ZBQ0lMSVRZPTMKICAg
IF9UUkFOU1BPUlQ9am91cm5hbAogICAgX0JPT1RfSUQ9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3
Y2UzMWI4ZTZkZjAKICAgIF9NQUNISU5FX0lEPTM2YTcxNzY1YTZiNjQzNjliY2YxMWNhNGNj
NjE4MWY0CiAgICBfSE9TVE5BTUU9bmVwdHVuMgogICAgX1NZU1RFTURfU0xJQ0U9c3lzdGVt
LnNsaWNlCiAgICBTWVNMT0dfSURFTlRJRklFUj1zeXN0ZW1kLW5ldHdvcmtkCiAgICBfVUlE
PTk5NgogICAgX0dJRD05OTUKICAgIF9DT01NPXN5c3RlbWQtbmV0d29yawogICAgX0VYRT0v
cm9vdC9saWIvc3lzdGVtZC9zeXN0ZW1kLW5ldHdvcmtkCiAgICBfQ01ETElORT0vbGliL3N5
c3RlbWQvc3lzdGVtZC1uZXR3b3JrZAogICAgX0NBUF9FRkZFQ1RJVkU9M2MwMAogICAgX1NZ
U1RFTURfQ0dST1VQPS9zeXN0ZW0uc2xpY2Uvc3lzdGVtZC1uZXR3b3JrZC5zZXJ2aWNlCiAg
ICBfU1lTVEVNRF9VTklUPXN5c3RlbWQtbmV0d29ya2Quc2VydmljZQogICAgQ09ERV9GSUxF
PXNyYy9uZXR3b3JrL25ldHdvcmtkLWxpbmsuYwogICAgQ09ERV9MSU5FPTMxOAogICAgQ09E
RV9GVU5DPWxpbmtfdXBkYXRlX2lwdjZfc3lzY3RsCiAgICBJTlRFUkZBQ0U9ZXRoMAogICAg
TUVTU0FHRT1ldGgwOiBJUHY2IHN1Y2Nlc3NmdWxseSBlbmFibGVkCiAgICBfUElEPTU0Ngog
ICAgX1NZU1RFTURfSU5WT0NBVElPTl9JRD03OTY4OWYzYmI3MzM0NTE4ODk0MTg2ZDlhMDA1
OGIyNgogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM1ODkwNzg3OApG
cmkgMjAxOS0xMS0yOSAxMzozMjozOC45ODA0MDkgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5
NmNjZmRjYzliZmRkMjM5O2k9NDQ1O2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZk
ZjA7bT02NzE2MGIyN2I7dD01OTg3YzQzNzllMDgzO3g9ZWIwNTFlYmIyMzEyY2RkZl0KICAg
IFNZU0xPR19GQUNJTElUWT0zCiAgICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9CT09UX0lE
PWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3
MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAg
IF9TWVNURU1EX1NMSUNFPXN5c3RlbS5zbGljZQogICAgU1lTTE9HX0lERU5USUZJRVI9c3lz
dGVtZC1uZXR3b3JrZAogICAgX1VJRD05OTYKICAgIF9HSUQ9OTk1CiAgICBfQ09NTT1zeXN0
ZW1kLW5ldHdvcmsKICAgIF9FWEU9L3Jvb3QvbGliL3N5c3RlbWQvc3lzdGVtZC1uZXR3b3Jr
ZAogICAgX0NNRExJTkU9L2xpYi9zeXN0ZW1kL3N5c3RlbWQtbmV0d29ya2QKICAgIF9DQVBf
RUZGRUNUSVZFPTNjMDAKICAgIF9TWVNURU1EX0NHUk9VUD0vc3lzdGVtLnNsaWNlL3N5c3Rl
bWQtbmV0d29ya2Quc2VydmljZQogICAgX1NZU1RFTURfVU5JVD1zeXN0ZW1kLW5ldHdvcmtk
LnNlcnZpY2UKICAgIENPREVfRklMRT1zcmMvbmV0d29yay9uZXR3b3JrZC1saW5rLmMKICAg
IFBSSU9SSVRZPTQKICAgIENPREVfTElORT0xNTc3CiAgICBDT0RFX0ZVTkM9bGlua191cF9o
YW5kbGVyCiAgICBJTlRFUkZBQ0U9c2l0MAogICAgTUVTU0FHRT1zaXQwOiBDb3VsZCBub3Qg
YnJpbmcgdXAgaW50ZXJmYWNlOiBPcGVyYXRpb24gbm90IHN1cHBvcnRlZAogICAgX1BJRD01
NDYKICAgIF9TWVNURU1EX0lOVk9DQVRJT05fSUQ9Nzk2ODlmM2JiNzMzNDUxODg5NDE4NmQ5
YTAwNThiMjYKICAgIF9TT1VSQ0VfUkVBTFRJTUVfVElNRVNUQU1QPTE1NzUwMzQzNTg5ODA0
MDkKRnJpIDIwMTktMTEtMjkgMTM6MzI6NDQuNDc1MjEzIFVUQyBbcz1hYTJmMTkzMWJmM2E0
OGY3OTZjY2ZkY2M5YmZkZDIzOTtpPTQ0NjtiPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFi
OGU2ZGYwO209NjcxYjRhZTAwO3Q9NTk4N2M0M2NkZGMwMzt4PWNkNmVlMWQ0ZmI5MDE0M10K
ICAgIFBSSU9SSVRZPTYKICAgIF9UUkFOU1BPUlQ9am91cm5hbAogICAgX1VJRD0wCiAgICBf
R0lEPTAKICAgIF9DQVBfRUZGRUNUSVZFPTNmZmZmZmZmZmYKICAgIF9CT09UX0lEPWM3OTdj
NzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2
YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAgIF9TWVNU
RU1EX1NMSUNFPXN5c3RlbS5zbGljZQogICAgQ09ERV9MSU5FPTc2CiAgICBDT0RFX0ZVTkM9
aGVscGVyX2xvZwogICAgQ09ERV9GSUxFPS91c3Ivc3JjL2RlYnVnL3Bob3NwaG9yLW5ldHdv
cmsvMS4wK2dpdEFVVE9JTkMrY2I0MmZlMjZmZS1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5j
bHVkZS9waG9zcGhvci1sb2dnaW5nL2xvZy5ocHAKICAgIE1FU1NBR0U9UmVmcmVzaGluZyB0
aGUgb2JqZWN0cy4KICAgIFNZU0xPR19JREVOVElGSUVSPXBob3NwaG9yLW5ldHdvcmstbWFu
YWdlcgogICAgX0NPTU09cGhvc3Bob3ItbmV0d29yCiAgICBfRVhFPS91c3IvYmluL3Bob3Nw
aG9yLW5ldHdvcmstbWFuYWdlcgogICAgX0NNRExJTkU9cGhvc3Bob3ItbmV0d29yay1tYW5h
Z2VyCiAgICBfU1lTVEVNRF9DR1JPVVA9L3N5c3RlbS5zbGljZS94eXoub3BlbmJtY19wcm9q
ZWN0Lk5ldHdvcmsuc2VydmljZQogICAgX1NZU1RFTURfVU5JVD14eXoub3BlbmJtY19wcm9q
ZWN0Lk5ldHdvcmsuc2VydmljZQogICAgVFJBTlNBQ1RJT05fSUQ9MzU1MTgyNDI5MgogICAg
X1BJRD01NDQKICAgIF9TWVNURU1EX0lOVk9DQVRJT05fSUQ9NWE0NjJhZWM0MDA3NDZiYmJh
YjgwMjE3NmUxMWUwM2IKICAgIF9TT1VSQ0VfUkVBTFRJTUVfVElNRVNUQU1QPTE1NzUwMzQz
NjQ0NzUyMTMKRnJpIDIwMTktMTEtMjkgMTM6MzI6NDQuNjI3NDIxIFVUQyBbcz1hYTJmMTkz
MWJmM2E0OGY3OTZjY2ZkY2M5YmZkZDIzOTtpPTQ0NztiPWM3OTdjNzkyNWFhYjQzMDQ4Yzlj
N2NlMzFiOGU2ZGYwO209NjcxYjZkYzMxO3Q9NTk4N2M0M2QwMGEzNDt4PWM2YjZjZmNmYmIz
Y2EwMF0KICAgIFBSSU9SSVRZPTYKICAgIFNZU0xPR19GQUNJTElUWT0zCiAgICBDT0RFX0ZJ
TEU9c3JjL2NvcmUvam9iLmMKICAgIFNZU0xPR19JREVOVElGSUVSPXN5c3RlbWQKICAgIEpP
Ql9UWVBFPXN0YXJ0CiAgICBfVFJBTlNQT1JUPWpvdXJuYWwKICAgIF9QSUQ9MQogICAgX1VJ
RD0wCiAgICBfR0lEPTAKICAgIF9DT01NPXN5c3RlbWQKICAgIF9FWEU9L2xpYi9zeXN0ZW1k
L3N5c3RlbWQKICAgIF9DTURMSU5FPS9zYmluL2luaXQKICAgIF9DQVBfRUZGRUNUSVZFPTNm
ZmZmZmZmZmYKICAgIF9TWVNURU1EX0NHUk9VUD0vaW5pdC5zY29wZQogICAgX1NZU1RFTURf
VU5JVD1pbml0LnNjb3BlCiAgICBfU1lTVEVNRF9TTElDRT0tLnNsaWNlCiAgICBfQk9PVF9J
RD1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMAogICAgX01BQ0hJTkVfSUQ9MzZh
NzE3NjVhNmI2NDM2OWJjZjExY2E0Y2M2MTgxZjQKICAgIF9IT1NUTkFNRT1uZXB0dW4yCiAg
ICBDT0RFX0xJTkU9NTc0CiAgICBDT0RFX0ZVTkM9am9iX2xvZ19iZWdpbl9zdGF0dXNfbWVz
c2FnZQogICAgTUVTU0FHRV9JRD03ZDQ5NThlODQyZGE0YTc1OGY2YzFjZGM3YjM2ZGNjNQog
ICAgTUVTU0FHRT1TdGFydGluZyBIb3N0bmFtZSBTZXJ2aWNlLi4uCiAgICBVTklUPXN5c3Rl
bWQtaG9zdG5hbWVkLnNlcnZpY2UKICAgIEpPQl9JRD0zNDc4CiAgICBJTlZPQ0FUSU9OX0lE
PWM3Y2Q3ZGI4ZWUxOTRhYzA4ZjQxNWFiODRlZWIyM2RiCiAgICBfU09VUkNFX1JFQUxUSU1F
X1RJTUVTVEFNUD0xNTc1MDM0MzY0NjI3NDIxCkZyaSAyMDE5LTExLTI5IDEzOjMyOjQ0LjY1
MTU3NyBVVEMgW3M9YWEyZjE5MzFiZjNhNDhmNzk2Y2NmZGNjOWJmZGQyMzk7aT00NDg7Yj1j
Nzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMDttPTY3MWI3M2E5Njt0PTU5ODdjNDNk
MDY4OTg7eD1lYjhlYTYyNWI5NWMxZDM2XQogICAgU1lTTE9HX0ZBQ0lMSVRZPTMKICAgIFNZ
U0xPR19JREVOVElGSUVSPXN5c3RlbWQKICAgIF9UUkFOU1BPUlQ9am91cm5hbAogICAgX1VJ
RD0wCiAgICBfR0lEPTAKICAgIF9FWEU9L2xpYi9zeXN0ZW1kL3N5c3RlbWQKICAgIF9DQVBf
RUZGRUNUSVZFPTNmZmZmZmZmZmYKICAgIF9CT09UX0lEPWM3OTdjNzkyNWFhYjQzMDQ4Yzlj
N2NlMzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2YjY0MzY5YmNmMTFjYTRj
YzYxODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAgIF9TWVNURU1EX1NMSUNFPXN5c3Rl
bS5zbGljZQogICAgUFJJT1JJVFk9NAogICAgVU5JVD1zeXN0ZW1kLWhvc3RuYW1lZC5zZXJ2
aWNlCiAgICBDT0RFX0ZJTEU9c3JjL2NvcmUvZXhlY3V0ZS5jCiAgICBDT0RFX0xJTkU9MzM4
OAogICAgQ09ERV9GVU5DPWV4ZWNfY2hpbGQKICAgIE1FU1NBR0U9c3lzdGVtZC1ob3N0bmFt
ZWQuc2VydmljZTogUHJpdmF0ZU5ldHdvcms9eWVzIGlzIGNvbmZpZ3VyZWQsIGJ1dCB0aGUg
a2VybmVsIGRvZXMgbm90IHN1cHBvcnQgbmV0d29yayBuYW1lc3BhY2VzLCBpZ25vcmluZy4K
ICAgIF9DT01NPShvc3RuYW1lZCkKICAgIF9DTURMSU5FPShvc3RuYW1lZCkKICAgIF9TWVNU
RU1EX0NHUk9VUD0vc3lzdGVtLnNsaWNlL3N5c3RlbWQtaG9zdG5hbWVkLnNlcnZpY2UKICAg
IF9TWVNURU1EX1VOSVQ9c3lzdGVtZC1ob3N0bmFtZWQuc2VydmljZQogICAgSU5WT0NBVElP
Tl9JRD1jN2NkN2RiOGVlMTk0YWMwOGY0MTVhYjg0ZWViMjNkYgogICAgX1BJRD01NDcKICAg
IF9TWVNURU1EX0lOVk9DQVRJT05fSUQ9YzdjZDdkYjhlZTE5NGFjMDhmNDE1YWI4NGVlYjIz
ZGIKICAgIF9TT1VSQ0VfUkVBTFRJTUVfVElNRVNUQU1QPTE1NzUwMzQzNjQ2NTE1NzcKRnJp
IDIwMTktMTEtMjkgMTM6MzI6NDQuODEzMzQ5IFVUQyBbcz1hYTJmMTkzMWJmM2E0OGY3OTZj
Y2ZkY2M5YmZkZDIzOTtpPTQ0OTtiPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYw
O209NjcxYjliMjg0O3Q9NTk4N2M0M2QyZTA4Njt4PTdlYWQ0YTljYzBmZTRjNjddCiAgICBQ
UklPUklUWT02CiAgICBTWVNMT0dfRkFDSUxJVFk9MwogICAgX1RSQU5TUE9SVD1qb3VybmFs
CiAgICBfQk9PVF9JRD1jNzk3Yzc5MjVhYWI0MzA0OGM5YzdjZTMxYjhlNmRmMAogICAgX01B
Q0hJTkVfSUQ9MzZhNzE3NjVhNmI2NDM2OWJjZjExY2E0Y2M2MTgxZjQKICAgIF9IT1NUTkFN
RT1uZXB0dW4yCiAgICBfU1lTVEVNRF9TTElDRT1zeXN0ZW0uc2xpY2UKICAgIFNZU0xPR19J
REVOVElGSUVSPXN5c3RlbWQtbmV0d29ya2QKICAgIF9VSUQ9OTk2CiAgICBfR0lEPTk5NQog
ICAgX0NPTU09c3lzdGVtZC1uZXR3b3JrCiAgICBfRVhFPS9yb290L2xpYi9zeXN0ZW1kL3N5
c3RlbWQtbmV0d29ya2QKICAgIF9DTURMSU5FPS9saWIvc3lzdGVtZC9zeXN0ZW1kLW5ldHdv
cmtkCiAgICBfQ0FQX0VGRkVDVElWRT0zYzAwCiAgICBfU1lTVEVNRF9DR1JPVVA9L3N5c3Rl
bS5zbGljZS9zeXN0ZW1kLW5ldHdvcmtkLnNlcnZpY2UKICAgIF9TWVNURU1EX1VOSVQ9c3lz
dGVtZC1uZXR3b3JrZC5zZXJ2aWNlCiAgICBDT0RFX0ZJTEU9c3JjL25ldHdvcmsvbmV0d29y
a2QtbGluay5jCiAgICBJTlRFUkZBQ0U9ZXRoMAogICAgQ09ERV9MSU5FPTg1OQogICAgQ09E
RV9GVU5DPWxpbmtfZW50ZXJfY29uZmlndXJlZAogICAgTUVTU0FHRT1ldGgwOiBDb25maWd1
cmVkCiAgICBfUElEPTU0NgogICAgX1NZU1RFTURfSU5WT0NBVElPTl9JRD03OTY4OWYzYmI3
MzM0NTE4ODk0MTg2ZDlhMDA1OGIyNgogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9
MTU3NTAzNDM2NDgxMzM0OQpGcmkgMjAxOS0xMS0yOSAxMzozMjo0NS4yMjI5NjQgVVRDIFtz
PWFhMmYxOTMxYmYzYTQ4Zjc5NmNjZmRjYzliZmRkMjM5O2k9NDRhO2I9Yzc5N2M3OTI1YWFi
NDMwNDhjOWM3Y2UzMWI4ZTZkZjA7bT02NzFiZmY5NzA7dD01OTg3YzQzZDkyNzc4O3g9OTky
MjA5MzUzYjg5YzI5Y10KICAgIFBSSU9SSVRZPTYKICAgIFNZU0xPR19GQUNJTElUWT0zCiAg
ICBDT0RFX0ZJTEU9c3JjL2NvcmUvam9iLmMKICAgIENPREVfTElORT05MjQKICAgIENPREVf
RlVOQz1qb2JfbG9nX2RvbmVfc3RhdHVzX21lc3NhZ2UKICAgIFNZU0xPR19JREVOVElGSUVS
PXN5c3RlbWQKICAgIEpPQl9UWVBFPXN0YXJ0CiAgICBKT0JfUkVTVUxUPWRvbmUKICAgIE1F
U1NBR0VfSUQ9MzlmNTM0NzlkM2EwNDVhYzhlMTE3ODYyNDgyMzFmYmYKICAgIF9UUkFOU1BP
UlQ9am91cm5hbAogICAgX1BJRD0xCiAgICBfVUlEPTAKICAgIF9HSUQ9MAogICAgX0NPTU09
c3lzdGVtZAogICAgX0VYRT0vbGliL3N5c3RlbWQvc3lzdGVtZAogICAgX0NNRExJTkU9L3Ni
aW4vaW5pdAogICAgX0NBUF9FRkZFQ1RJVkU9M2ZmZmZmZmZmZgogICAgX1NZU1RFTURfQ0dS
T1VQPS9pbml0LnNjb3BlCiAgICBfU1lTVEVNRF9VTklUPWluaXQuc2NvcGUKICAgIF9TWVNU
RU1EX1NMSUNFPS0uc2xpY2UKICAgIF9CT09UX0lEPWM3OTdjNzkyNWFhYjQzMDQ4YzljN2Nl
MzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYx
ODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAgIFVOSVQ9c3lzdGVtZC1ob3N0bmFtZWQu
c2VydmljZQogICAgTUVTU0FHRT1TdGFydGVkIEhvc3RuYW1lIFNlcnZpY2UuCiAgICBKT0Jf
SUQ9MzQ3OAogICAgSU5WT0NBVElPTl9JRD1jN2NkN2RiOGVlMTk0YWMwOGY0MTVhYjg0ZWVi
MjNkYgogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM2NTIyMjk2NApG
cmkgMjAxOS0xMS0yOSAxMzozMjo0NS4yNjc2ODAgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4Zjc5
NmNjZmRjYzliZmRkMjM5O2k9NDRiO2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4ZTZk
ZjA7bT02NzFjMGExMzU7dD01OTg3YzQzZDljZjM3O3g9ZDZjYzBiN2FlYWQ0OTUyZl0KICAg
IFBSSU9SSVRZPTYKICAgIF9UUkFOU1BPUlQ9am91cm5hbAogICAgX1VJRD0wCiAgICBfR0lE
PTAKICAgIF9DQVBfRUZGRUNUSVZFPTNmZmZmZmZmZmYKICAgIF9CT09UX0lEPWM3OTdjNzky
NWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2YjY0
MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAgIF9TWVNURU1E
X1NMSUNFPXN5c3RlbS5zbGljZQogICAgQ09ERV9MSU5FPTc2CiAgICBDT0RFX0ZVTkM9aGVs
cGVyX2xvZwogICAgQ09ERV9GSUxFPS91c3Ivc3JjL2RlYnVnL3Bob3NwaG9yLW5ldHdvcmsv
MS4wK2dpdEFVVE9JTkMrY2I0MmZlMjZmZS1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVk
ZS9waG9zcGhvci1sb2dnaW5nL2xvZy5ocHAKICAgIFNZU0xPR19JREVOVElGSUVSPXBob3Nw
aG9yLW5ldHdvcmstbWFuYWdlcgogICAgX0NPTU09cGhvc3Bob3ItbmV0d29yCiAgICBfRVhF
PS91c3IvYmluL3Bob3NwaG9yLW5ldHdvcmstbWFuYWdlcgogICAgX0NNRExJTkU9cGhvc3Bo
b3ItbmV0d29yay1tYW5hZ2VyCiAgICBfU1lTVEVNRF9DR1JPVVA9L3N5c3RlbS5zbGljZS94
eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuc2VydmljZQogICAgX1NZU1RFTURfVU5JVD14
eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuc2VydmljZQogICAgTUVTU0FHRT1SZWZyZXNo
aW5nIGNvbXBsZXRlLgogICAgX1BJRD01NDQKICAgIF9TWVNURU1EX0lOVk9DQVRJT05fSUQ9
NWE0NjJhZWM0MDA3NDZiYmJhYjgwMjE3NmUxMWUwM2IKICAgIFRSQU5TQUNUSU9OX0lEPTkz
Mjk3ODA1MgogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM2NTI2NzY4
MApGcmkgMjAxOS0xMS0yOSAxMzozMjo1NS4yNzEzNzYgVVRDIFtzPWFhMmYxOTMxYmYzYTQ4
Zjc5NmNjZmRjYzliZmRkMjM5O2k9NDRjO2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3Y2UzMWI4
ZTZkZjA7bT02NzI1OTRhN2U7dD01OTg3YzQ0NzI3ODgwO3g9OWI2OGE5OGZlM2JkNzcwMF0K
ICAgIFBSSU9SSVRZPTYKICAgIF9UUkFOU1BPUlQ9am91cm5hbAogICAgX1VJRD0wCiAgICBf
R0lEPTAKICAgIF9DQVBfRUZGRUNUSVZFPTNmZmZmZmZmZmYKICAgIF9CT09UX0lEPWM3OTdj
NzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3MTc2NWE2
YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAgIF9TWVNU
RU1EX1NMSUNFPXN5c3RlbS5zbGljZQogICAgQ09ERV9MSU5FPTc2CiAgICBDT0RFX0ZVTkM9
aGVscGVyX2xvZwogICAgQ09ERV9GSUxFPS91c3Ivc3JjL2RlYnVnL3Bob3NwaG9yLW5ldHdv
cmsvMS4wK2dpdEFVVE9JTkMrY2I0MmZlMjZmZS1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5j
bHVkZS9waG9zcGhvci1sb2dnaW5nL2xvZy5ocHAKICAgIE1FU1NBR0U9UmVmcmVzaGluZyB0
aGUgb2JqZWN0cy4KICAgIFNZU0xPR19JREVOVElGSUVSPXBob3NwaG9yLW5ldHdvcmstbWFu
YWdlcgogICAgX0NPTU09cGhvc3Bob3ItbmV0d29yCiAgICBfRVhFPS91c3IvYmluL3Bob3Nw
aG9yLW5ldHdvcmstbWFuYWdlcgogICAgX0NNRExJTkU9cGhvc3Bob3ItbmV0d29yay1tYW5h
Z2VyCiAgICBfU1lTVEVNRF9DR1JPVVA9L3N5c3RlbS5zbGljZS94eXoub3BlbmJtY19wcm9q
ZWN0Lk5ldHdvcmsuc2VydmljZQogICAgX1NZU1RFTURfVU5JVD14eXoub3BlbmJtY19wcm9q
ZWN0Lk5ldHdvcmsuc2VydmljZQogICAgX1BJRD01NDQKICAgIF9TWVNURU1EX0lOVk9DQVRJ
T05fSUQ9NWE0NjJhZWM0MDA3NDZiYmJhYjgwMjE3NmUxMWUwM2IKICAgIFRSQU5TQUNUSU9O
X0lEPTkzMjk3ODA1MgogICAgX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVA9MTU3NTAzNDM3
NTI3MTM3NgpGcmkgMjAxOS0xMS0yOSAxMzozMjo1NS4zNzMyNjMgVVRDIFtzPWFhMmYxOTMx
YmYzYTQ4Zjc5NmNjZmRjYzliZmRkMjM5O2k9NDRkO2I9Yzc5N2M3OTI1YWFiNDMwNDhjOWM3
Y2UzMWI4ZTZkZjA7bT02NzI1YWQ0MjM7dD01OTg3YzQ0NzQwMjI1O3g9ODkzNjNkNzdhZjAz
ODVjYl0KICAgIFBSSU9SSVRZPTYKICAgIF9UUkFOU1BPUlQ9am91cm5hbAogICAgX1VJRD0w
CiAgICBfR0lEPTAKICAgIF9DQVBfRUZGRUNUSVZFPTNmZmZmZmZmZmYKICAgIF9CT09UX0lE
PWM3OTdjNzkyNWFhYjQzMDQ4YzljN2NlMzFiOGU2ZGYwCiAgICBfTUFDSElORV9JRD0zNmE3
MTc2NWE2YjY0MzY5YmNmMTFjYTRjYzYxODFmNAogICAgX0hPU1ROQU1FPW5lcHR1bjIKICAg
IF9TWVNURU1EX1NMSUNFPXN5c3RlbS5zbGljZQogICAgQ09ERV9MSU5FPTc2CiAgICBDT0RF
X0ZVTkM9aGVscGVyX2xvZwogICAgQ09ERV9GSUxFPS91c3Ivc3JjL2RlYnVnL3Bob3NwaG9y
LW5ldHdvcmsvMS4wK2dpdEFVVE9JTkMrY2I0MmZlMjZmZS1yMS9yZWNpcGUtc3lzcm9vdC91
c3IvaW5jbHVkZS9waG9zcGhvci1sb2dnaW5nL2xvZy5ocHAKICAgIFNZU0xPR19JREVOVElG
SUVSPXBob3NwaG9yLW5ldHdvcmstbWFuYWdlcgogICAgX0NPTU09cGhvc3Bob3ItbmV0d29y
CiAgICBfRVhFPS91c3IvYmluL3Bob3NwaG9yLW5ldHdvcmstbWFuYWdlcgogICAgX0NNRExJ
TkU9cGhvc3Bob3ItbmV0d29yay1tYW5hZ2VyCiAgICBfU1lTVEVNRF9DR1JPVVA9L3N5c3Rl
bS5zbGljZS94eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuc2VydmljZQogICAgX1NZU1RF
TURfVU5JVD14eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuc2VydmljZQogICAgTUVTU0FH
RT1SZWZyZXNoaW5nIGNvbXBsZXRlLgogICAgX1BJRD01NDQKICAgIF9TWVNURU1EX0lOVk9D
QVRJT05fSUQ9NWE0NjJhZWM0MDA3NDZiYmJhYjgwMjE3NmUxMWUwM2IKICAgIFRSQU5TQUNU
SU9OX0lEPTE1MTIyNDE4ODMKICAgIF9TT1VSQ0VfUkVBTFRJTUVfVElNRVNUQU1QPTE1NzUw
MzQzNzUzNzMyNjMK
--------------454787088A7B17CF563616E6
Content-Type: text/plain; charset=UTF-8;
 name="ioctl_debug.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="ioctl_debug.patch"

LS0tIGEvZXRoZXJuZXRfaW50ZXJmYWNlLmNwcAkyMDE5LTEwLTE0IDIxOjI2OjM5LjAwMDAw
MDAwMCArMDMwMAorKysgYi9ldGhlcm5ldF9pbnRlcmZhY2UuY3BwCTIwMTktMTEtMjkgMTU6
NTg6NTUuNDkzMTg3NjU2ICswMzAwCkBAIC0yNTEsNyArMjUxLDggQEAKICAgICAgICAgaWYg
KGlvY3RsKHNvY2ssIFNJT0NFVEhUT09MLCAmaWZyKSA8IDApCiAgICAgICAgIHsKICAgICAg
ICAgICAgIGxvZzxsZXZlbDo6RVJSPigiaW9jdGwgZmFpbGVkIGZvciBTSU9DRVRIVE9PTDoi
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudHJ5KCJFUlJPUj0lcyIsIHN0cmVy
cm9yKGVycm5vKSkpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudHJ5KCJFUlJP
Uj0lczsgaW50ZXJmYWNlIG5hbWU9JXMiLCBzdHJlcnJvcihlcnJubyksaWZyLmlmcl9uYW1l
KSk7CisKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICB9CiAgICAgICAgIHNwZWVkID0g
ZWRhdGEuc3BlZWQ7CkBAIC0yODYsNyArMjg3LDcgQEAKICAgICBpZiAoaW9jdGwoc29jaywg
U0lPQ0dJRkhXQUREUiwgJmlmcikgIT0gMCkKICAgICB7CiAgICAgICAgIGxvZzxsZXZlbDo6
RVJSPigiaW9jdGwgZmFpbGVkIGZvciBTSU9DR0lGSFdBRERSOiIsCi0gICAgICAgICAgICAg
ICAgICAgICAgICBlbnRyeSgiRVJST1I9JXMiLCBzdHJlcnJvcihlcnJubykpKTsKKyAgICAg
ICAgICAgICAgICAgICAgICAgIGVudHJ5KCJFUlJPUj0lczsgaW50ZXJmYWNlIG5hbWU9JXMi
LCBzdHJlcnJvcihlcnJubyksaWZyLmlmcl9uYW1lKSk7CiAgICAgICAgIGVsb2c8SW50ZXJu
YWxGYWlsdXJlPigpOwogICAgIH0KCg==
--------------454787088A7B17CF563616E6--
