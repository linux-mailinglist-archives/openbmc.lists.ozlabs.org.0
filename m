Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08064D700
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 08:10:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXjzn5Qklz3bTM
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 18:10:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q7MbSJN9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=amirradh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q7MbSJN9;
	dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRVnH2sXlz3bNy
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 06:28:02 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id c129so18162934oia.0
        for <openbmc@lists.ozlabs.org>; Tue, 06 Dec 2022 11:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JrKkB7xj9jUbph4AvbXPGxmkksG6rMiy7yrz6wFPKr8=;
        b=Q7MbSJN9J9YeP4c/dQB59v+b+3YXwEHW1vWBEnKAgC+Z8YMMDqc195NKmfX4FcIqNG
         ZLFCv89KzPiEjGjZ2VWzYrfOYgnK0fs3TMVo4jcFi/9yzkeG8fwfRaiRrfltwhsa8v1P
         hSiXhCZjfvNu5oatR/fmkZXXUK79mWB7hf/TkHHqq3YV0/J8z/2w7C/J9NclIDlDdEWG
         guGxxgR8y7rYFjD+NaVIqUNAoTjESAQ9A4h59dxupuv+iDx93TQRqqT61AVfTNCORLAe
         sSgewp4APzQ/GyLZAruIjFzaR43ri4KFOojpfM5VKfaGJp+/VFbXJy2USdXRE7N66wGN
         XmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrKkB7xj9jUbph4AvbXPGxmkksG6rMiy7yrz6wFPKr8=;
        b=PDEIUTgw5cyWs+B/O3WYQcFUbSObiDAplfHx0RoCZO5I6xWkKlLhHKU4NqvkP2xKXt
         a9eJrQu16tvzNmzI97PB8prxl02KKZrkPqoy+GDB02aZqngYl3b3QVYmUyWRXofVjddg
         OfK82OTP+m+KkzMoaJ3GtWjiXm5m0O8YWqjgfdne3o5tWjWzccEWR/oS08olLFGlKP1Y
         N7mCjsAxHC1dY/IPG1YhYLk04BK9pAw5kFZBk+ScGpwcSO0VKGpv4iIA+mvhS3l5JCa/
         gV2sEs6zAJG6g1ILMthlG8Z49/M3gjB3wUS9xhrI9zMLqDG7Ua3xfOoKwCfKd+aHbOLK
         53Og==
X-Gm-Message-State: ANoB5pljDBBSGK4WoRKTY7W4tnjNPA0PZTqH8jCsOEBAR8CgZDi9dbOD
	J79C9YABxq7GDhIEWpHUFek127c8YcFntq0rJBsdDGtwEI0=
X-Google-Smtp-Source: AA0mqf4tjdMTTvD/ztgHGMK1ctR+81jkbfNhOCIv7zebGjayBVl9YTOrwsSDJA45HMwuBasdDr6EUBSxcL15rmNM/5g=
X-Received: by 2002:a05:6808:b17:b0:35c:76f:a52d with SMTP id
 s23-20020a0568080b1700b0035c076fa52dmr7905471oij.80.1670354878190; Tue, 06
 Dec 2022 11:27:58 -0800 (PST)
MIME-Version: 1.0
References: <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
 <20221204234449.GG18848@packtop>
In-Reply-To: <20221204234449.GG18848@packtop>
From: Hamid Amirrad <amirradh@gmail.com>
Date: Tue, 6 Dec 2022 14:27:47 -0500
Message-ID: <CACFAz8CO7sm6TXCct35kOH-mWZOAj=UHuRisgw3rSpawRxr9jQ@mail.gmail.com>
Subject: Re: Changing ethernet port speed
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="00000000000029d9da05ef2dcd68"
X-Mailman-Approved-At: Thu, 15 Dec 2022 18:08:48 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000029d9da05ef2dcd68
Content-Type: text/plain; charset="UTF-8"

Hi,

I see that the u-boot has been recently upgraded to 2019.04.
I created the image as follows:
1. Checked out the code
2. . setup evb-ast2500
3. time bitbake obmc-phosphor-image

Then I copied the created image (bmc-image)
from /trunk/build/evb-ast2500/tmp/deploy/images/evb-ast2500/obmc-phosphor-image-evb-ast2500-20221122160306.static.mtd.all.tar
to my LC having BMC module. I used ./socflash.sh to upgrade the BMC image
to one just created. After upgrade is done, I still see the old u-boot
version (below). Is this something else I need to do for the u-boot to be
at revision 2019?

ast# version

U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
GNU ld (GNU Binutils) 2.37.20210721

I am using BMC simulator on another server and on that the u-boot revision
is fine (below). Not sure why u-boot is not at 2019 when I compile the code
directly.
ast# version
U-Boot 2019.04 (Nov 10 2022 - 00:12:58 +0000)

arm-openbmc-linux-gnueabi-gcc (GCC) 12.2.0
GNU ld (GNU Binutils) 2.39.0.20220819

Any help would be greatly appreciated.

Thanks,
Hamid

On Sun, Dec 4, 2022 at 6:45 PM Zev Weiss <zweiss@equinix.com> wrote:

> On Thu, Dec 01, 2022 at 09:27:44AM PST, Hamid Amirrad wrote:
> >Hi,
> >
> >I am trying to change the Ethernet port speed from 10Mbps to 1Gbps, but I
> >can't find a way to do that. Can you please point me in the right
> direction?
> >
> >Thanks,
> >Hamid
> >
> >
> >ast# version
> >U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
> >arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
> >GNU ld (GNU Binutils) 2.37.20210721
> >
> >ast# printenv
> >SN=8513060012
> >baudrate=115200
> >bootargs=console=ttyS4,115200n8 root=/dev/ram rw
> >bootcmd=bootm 20080000
> >bootdelay=2
> >ethact=FTGMAC100#0
> >ethaddr=00:02:C5:38:1D:DF
> >ethaddr1=00:02:C5:38:1D:E0
> >ipaddr=172.16.141.104
> >spi_dma=yes
> >stderr=serial
> >stdin=serial
> >stdout=serial
> >verify=yes
> >
> >ast# ping 172.16.141.1
> >FTGMAC100#0: link up, *10Mbps half-duplex*
> >Using FTGMAC100#0 device
> >
> >ARP Retry count exceeded; starting again
> >ping failed; host 172.16.141.1 is not alive
>
> Given what's pasted here, it looks like it's u-boot where you're seeing
> the problem -- does Linux successfully autonegotiate a higher speed?
>
> Also, is this a Broadcom phy by any chance?  I've got a platform with a
> Broadcom BMC54616S phy on which Linux autonegotiates a 1Gbps link just
> fine, but u-boot would only negotiate slower speeds (I don't remember
> offhand if it was 10Mbps or 100Mbps).  I've got a hackish patch I'm
> running internally that gets 1Gbps aneg working in u-boot, but at the
> cost of breaking 10/100Mbps aneg (and I haven't gotten around to digging
> in and fixing that and sending it upstream).
>
>
> Zev
>

--00000000000029d9da05ef2dcd68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I see that the u-boot has been rece=
ntly upgraded to 2019.04.=C2=A0</div><div>I created the image as follows:</=
div><div>1. Checked out the code</div><div>2. . setup evb-ast2500</div><div=
>3.=C2=A0time bitbake obmc-phosphor-image</div><div><br></div><div>Then I c=
opied the created image (bmc-image) from=C2=A0/trunk/build/evb-ast2500/tmp/=
deploy/images/evb-ast2500/obmc-phosphor-image-evb-ast2500-20221122160306.st=
atic.mtd.all.tar to my LC having BMC module. I used=C2=A0./socflash.sh to u=
pgrade the BMC image to one just created. After upgrade is done, I still se=
e the old u-boot version (below). Is this something else I need to do for t=
he u-boot to be at revision 2019?</div><div><br></div><div>ast# version<br>=
<br>U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)<br>arm-openbmc-linux-gnue=
abi-gcc (GCC) 11.2.0<br>GNU ld (GNU Binutils) 2.37.20210721<br></div><div><=
br></div><div>I am using BMC simulator on another server and on that the u-=
boot revision is fine (below). Not sure why u-boot is not at 2019 when I co=
mpile the code directly.</div><div>ast# version<br>U-Boot 2019.04 (Nov 10 2=
022 - 00:12:58 +0000)<br><br>arm-openbmc-linux-gnueabi-gcc (GCC) 12.2.0<br>=
GNU ld (GNU Binutils) 2.39.0.20220819<br></div><div><br></div><div>Any help=
 would be greatly appreciated.</div><div><br></div><div>Thanks,</div><div>H=
amid</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Sun, Dec 4, 2022 at 6:45 PM Zev Weiss &lt;<a href=3D"mailto:zw=
eiss@equinix.com">zweiss@equinix.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Thu, Dec 01, 2022 at 09:27:44AM PST,=
 Hamid Amirrad wrote:<br>
&gt;Hi,<br>
&gt;<br>
&gt;I am trying to change the Ethernet port speed from 10Mbps to 1Gbps, but=
 I<br>
&gt;can&#39;t find a way to do that. Can you please point me in the right d=
irection?<br>
&gt;<br>
&gt;Thanks,<br>
&gt;Hamid<br>
&gt;<br>
&gt;<br>
&gt;ast# version<br>
&gt;U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)<br>
&gt;arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0<br>
&gt;GNU ld (GNU Binutils) 2.37.20210721<br>
&gt;<br>
&gt;ast# printenv<br>
&gt;SN=3D8513060012<br>
&gt;baudrate=3D115200<br>
&gt;bootargs=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw<br>
&gt;bootcmd=3Dbootm 20080000<br>
&gt;bootdelay=3D2<br>
&gt;ethact=3DFTGMAC100#0<br>
&gt;ethaddr=3D00:02:C5:38:1D:DF<br>
&gt;ethaddr1=3D00:02:C5:38:1D:E0<br>
&gt;ipaddr=3D172.16.141.104<br>
&gt;spi_dma=3Dyes<br>
&gt;stderr=3Dserial<br>
&gt;stdin=3Dserial<br>
&gt;stdout=3Dserial<br>
&gt;verify=3Dyes<br>
&gt;<br>
&gt;ast# ping 172.16.141.1<br>
&gt;FTGMAC100#0: link up, *10Mbps half-duplex*<br>
&gt;Using FTGMAC100#0 device<br>
&gt;<br>
&gt;ARP Retry count exceeded; starting again<br>
&gt;ping failed; host 172.16.141.1 is not alive<br>
<br>
Given what&#39;s pasted here, it looks like it&#39;s u-boot where you&#39;r=
e seeing<br>
the problem -- does Linux successfully autonegotiate a higher speed?<br>
<br>
Also, is this a Broadcom phy by any chance?=C2=A0 I&#39;ve got a platform w=
ith a<br>
Broadcom BMC54616S phy on which Linux autonegotiates a 1Gbps link just<br>
fine, but u-boot would only negotiate slower speeds (I don&#39;t remember<b=
r>
offhand if it was 10Mbps or 100Mbps).=C2=A0 I&#39;ve got a hackish patch I&=
#39;m<br>
running internally that gets 1Gbps aneg working in u-boot, but at the<br>
cost of breaking 10/100Mbps aneg (and I haven&#39;t gotten around to diggin=
g<br>
in and fixing that and sending it upstream).<br>
<br>
<br>
Zev<br>
</blockquote></div>

--00000000000029d9da05ef2dcd68--
