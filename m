Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82290641B41
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 08:10:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NPyW13MZwz3bcN
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 18:10:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Use the ip4 mechanism for ip4 addresses: a:50.196.187.250) smtp.mailfrom=baywinds.org (client-ip=50.196.187.248; helo=baywinds.org; envelope-from=bferrell@baywinds.org; receiver=<UNKNOWN>)
X-Greylist: delayed 2887 seconds by postgrey-1.36 at boromir; Sun, 04 Dec 2022 18:10:04 AEDT
Received: from baywinds.org (50-196-187-248-static.hfc.comcastbusiness.net [50.196.187.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NPyVh5xnrz3bVP
	for <openbmc@lists.ozlabs.org>; Sun,  4 Dec 2022 18:10:04 +1100 (AEDT)
Received: from [192.0.2.93] (mac [192.0.2.93])
	by baywinds.org (8.14.4/8.14.4) with ESMTP id 2B46LneM026603
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <openbmc@lists.ozlabs.org>; Sat, 3 Dec 2022 22:21:49 -0800
Content-Type: multipart/alternative;
 boundary="------------2wyjc4Ue3psJvvnvdQe7ucaK"
Message-ID: <44e8a1b5-22cc-1599-4f1e-5071e42fba8d@baywinds.org>
Date: Sat, 3 Dec 2022 22:21:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: Changing ethernet port speed
To: openbmc@lists.ozlabs.org
References: <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
Content-Language: en-US
From: Bruce Ferrell <bferrell@baywinds.org>
In-Reply-To: <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
X-Greylist: inspected by milter-greylist-4.6.4 (baywinds.org [192.0.2.134]); Sat, 03 Dec 2022 22:21:49 -0800 (PST) for IP:'192.0.2.93' DOMAIN:'mac' HELO:'[192.0.2.93]' FROM:'bferrell@baywinds.org' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (baywinds.org [192.0.2.134]); Sat, 03 Dec 2022 22:21:49 -0800 (PST)
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
--------------2wyjc4Ue3psJvvnvdQe7ucaK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Normally, those parms should be modified with ipmitool


On 12/1/22 9:27 AM, Hamid Amirrad wrote:
> Hi,
>
> I am trying to change the Ethernet port speed from 10Mbps to 1Gbps, 
> but I can't find a way to do that. Can you please point me in the 
> right direction?
>
> Thanks,
> Hamid
>
>
> ast# version
> U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
> arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
> GNU ld (GNU Binutils) 2.37.20210721
>
> ast# printenv
> SN=8513060012
> baudrate=115200
> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
> bootcmd=bootm 20080000
> bootdelay=2
> ethact=FTGMAC100#0
> ethaddr=00:02:C5:38:1D:DF
> ethaddr1=00:02:C5:38:1D:E0
> ipaddr=172.16.141.104
> spi_dma=yes
> stderr=serial
> stdin=serial
> stdout=serial
> verify=yes
>
> ast# ping 172.16.141.1
> FTGMAC100#0: link up, *10Mbps half-duplex*
> Using FTGMAC100#0 device
>
> ARP Retry count exceeded; starting again
> ping failed; host 172.16.141.1 is not alive
--------------2wyjc4Ue3psJvvnvdQe7ucaK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <p>Normally, those parms should be modified with ipmitool<br>
    </p>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 12/1/22 9:27 AM, Hamid Amirrad
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>I am trying to change the Ethernet port speed from 10Mbps
          to 1Gbps, but I can't find a way to do that. Can you please
          point me in the right direction?</div>
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Hamid</div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>ast# version<br>
          U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)<br>
          arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0<br>
          GNU ld (GNU Binutils) 2.37.20210721<br>
        </div>
        <div><br>
        </div>
        <div>ast# printenv<br>
          SN=8513060012<br>
          baudrate=115200<br>
          bootargs=console=ttyS4,115200n8 root=/dev/ram rw<br>
          bootcmd=bootm 20080000<br>
          bootdelay=2<br>
          ethact=FTGMAC100#0<br>
          ethaddr=00:02:C5:38:1D:DF<br>
          ethaddr1=00:02:C5:38:1D:E0</div>
        <div>ipaddr=172.16.141.104<br>
          spi_dma=yes<br>
          stderr=serial<br>
          stdin=serial<br>
          stdout=serial<br>
          verify=yes<br>
        </div>
        <div><br>
        </div>
        <div>ast# ping 172.16.141.1<br>
          FTGMAC100#0: link up, <b><font color="#ff0000">10Mbps
              half-duplex</font></b><br>
          Using FTGMAC100#0 device<br>
          <br>
          ARP Retry count exceeded; starting again<br>
          ping failed; host 172.16.141.1 is not alive<br>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------2wyjc4Ue3psJvvnvdQe7ucaK--
