Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC6B12DD
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 18:37:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tkvg2nl8zF4jm
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 02:37:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BC4RHj99"; 
 dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tkv23cZwzF4YV
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 02:36:59 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id c20so15528113eds.1
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jliOy6yIpOYYHkqndFE7UNJkAhGTFKyP9I/RLO49/6o=;
 b=BC4RHj99zywNv0VTqgsOrbZRmHtHsPLW3u9QNIsLvMm/fIdrG+WrmjQdU74c79fWvU
 Cp07ijKg0FJOYI7LHcGgPRy3pv1TR0ibg09cNfOw/8nhsXqL5GXk2vPGEm7xDFqhkQe9
 erd4vhYOyRWYLu+L04GEzlJpk5iBTYtMv2yLWS2j5cFP5ZPrFZmePhsA13/RtVPfZtvv
 lCReeW5I2OnUOMnrGKRnoiAlp+A7vfSBo4ZMNCWHwmeb/4Pr8FojZtc2fC8CxYtA0lJb
 eT96HPcgpM1HPpSw1+D3kdnPTeKdI4AvIlzAlfw5VjlstCFU832NHVlHW8/Gbns6wBkH
 Dr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jliOy6yIpOYYHkqndFE7UNJkAhGTFKyP9I/RLO49/6o=;
 b=e5v+pFOSTAQMhLmmVDpt3Onnvrg+qe2hiHdxB+hqJDgmbqfgTUMbBokkke6jLH00Gv
 LBAxDHkES6FFwhPUAD4btmyWUTeu8Zj2rY8oIuKHhVrGTebFM5WJHz01EhEwu0FluuA0
 Wszs9XRRjPVdKgiKjBpmS4W2SShGF4IUmWWEFsy7E4e+N0+jKNzrsoao7VOFBUFtjTvW
 V1wJF1EFZXHIZlMVTi6jiWsMCcdgHNpTmoGhoGlPLk/qUh1cwFpbJ8alnk0mvOzl3xeR
 lcAjApcNetYC96unFkzBR3km/4VS6cKgP1rpqv1286ErOMRJ52On47Lp4aUsIh5h20Lp
 qovA==
X-Gm-Message-State: APjAAAVDjojGvpq9PF9jqVJ3x+FVLOGAt7VCdfUEWZ3JKhVV61KrbsZI
 v7JQuV7m8oaqHC/CRfeDjfdHvv/e1Do+QEyXnu+y6w==
X-Google-Smtp-Source: APXvYqykjzZ8lDPC7o9I3DPlfOFxuHGOJuYZGH1nPZi6Z/OEdhpZ0eT5daMIwRkaz/CCHQslqD7qHGY+drPJ+2vSnMw=
X-Received: by 2002:a17:906:1c46:: with SMTP id
 l6mr35297358ejg.304.1568306210522; 
 Thu, 12 Sep 2019 09:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <2634903dafda431988ffabd873710768@lenovo.com>
 <CAO=notwLxLPEhxVj+A8Q0TcnSU2HVG_CFr5BvbwaSUU2bwgfjQ@mail.gmail.com>
 <CABoTLcTyNDDQR4zVD2UGrj4L7r4agQeZ1oJKYb37--HZn_aPAw@mail.gmail.com>
In-Reply-To: <CABoTLcTyNDDQR4zVD2UGrj4L7r4agQeZ1oJKYb37--HZn_aPAw@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 12 Sep 2019 12:36:33 -0400
Message-ID: <CABoTLcSsGEqVYyvSzaytu81VYQPiu8a-w=C57Lw_W7rYaWkijg@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: Update over eSPI interface
To: Harry Sung1 <hsung1@lenovo.com>
Content-Type: multipart/mixed; boundary="000000000000949b5405925dbe29"
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
Cc: Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000949b5405925dbe29
Content-Type: multipart/alternative; boundary="000000000000949b5305925dbe27"

--000000000000949b5305925dbe27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here some more details on how the USB virtual NIC works:
Sources

   -


   https://events.static.linuxfound.org/sites/events/files/slides/USB%20Gad=
get%20Configfs%20API_0.pdf
   -

   https://developer.toradex.com/knowledge-base/usb-device-mode-(linux)


Build Configuration

linux/arch/arm/boot/dts/aspeed-bmc-[machine].dts

+&vhub {

+       status =3D "okay";

+};

+

gbmc/[...]/recipes-kernel/linux/linux-aspeed/[machine].cfg

+# Enable virtual USB NIC

+CONFIG_USB_CONFIGFS_ECM=3Dy

+CONFIG_USB_CONFIGFS_ECM_SUBSET=3Dy

BMC Runtime Configuration

See attached usb_network.sh. This needs to be executed at startup.
Obviously, you'll need to replace the vendor and product ID as well as the
strings with something different.


Network configuration needs to go into /etc/systemd/network. See
attached 00-bmc-usb0.network.


Host Runtime Configuration

As soon as the BMC is booted, the host should see the BMC as an additional
USB hub.


The last command on the BMC will cause an actual USB device to be visible
to the host. If it does not get auto-loaded, load the cdc_ether driver
manually. Once loaded, this adds a "usb0" network interface on the host
that can be configured like any other Ethernet device:

ifconfig usb0 169.254.254.1 netmask 255.255.255.0 up



From here on you can then execute SSH / SCP from the host to the local BMC.
However, for phosphor-ipmi-flash, it might be better to implement a new
TCP-based method right in phosphor-ipmi-flash both on the BMC and the host
side. The important bit is that whatever method you use, it must only stage
the image to /tmp where phosphor-ipmi-flash-bios-verify.target can then
pick it up for verification. You certainly don't want to have root-level
access from the host to the BMC as that would allow the host to take
ownership of the BMC.

Oskar.

On Wed, Sep 11, 2019 at 11:23 AM Oskar Senft <osk@google.com> wrote:

> Hi Harry
>
> I've done some experiments with the USB virtual NIC on the AST2500 and
> found that to work rather nicely.
>
> We're currently investigating in my team to use that interface as the
> primary method for transferring data between the host and the BMC. From
> what I can tell, this seems to be the fastest, most secure method. The
> advantage also is that it doesn't need any low-level HW / memory access o=
n
> the host. However, the host still needs to have the USB NIC on its side
> supported (driver) and configured (IP address). For our environment
> (Linux), this is easy to achieve.
>
> It should be possible to update the phosphor-ipmi-flash BMC and host side
> implementation to use a USB NIC for data transfer. However, we haven't
> investigated those details yet.
>
> Other methods for data transfer (LPC, PCIe, eSPI, SuperI/O) all seem to
> open up a large security hole in the AST2500.
>
> Oskar.
>
> On Wed, Sep 11, 2019 at 10:45 AM Patrick Venture <venture@google.com>
> wrote:
>
>> On Wed, Sep 11, 2019 at 1:59 AM Harry Sung1 <hsung1@lenovo.com> wrote:
>> >
>> >
>> > > On Mon, Sep 9, 2019 at 7:01 AM Oskar Senft <osk@google.com> wrote:
>> > > >
>> > > > Hi Harry
>> > > >
>> > > > What's the behavior on eSPI? I assume you still have the
>> aspeed-lpc-ctrl
>> > > enabled, right?
>> > > >
>> > > > Thanks
>> > > > Oskar.
>> >
>> > Hi Oskar,
>> > Yes, I still enabled the aspeed-lpc-ctrl in my build. Because
>> phosphor-ipmi-flash has some mandatory actions on /dev/aspeed-lpc-ctrl
>> before flash (settings for HICR5, HICR7 and HICR8) even though these
>> settings are meaningless for eSPI.
>> >
>> > Currently, I set ESPI084 (source address) and ESPI088 (target address)
>> registers manually because linux seems not have a driver can help us to =
set
>> ESPI084 and ESPI088.
>> >
>> > Due to the limitation of AST2500, we can only write 256 bytes in one
>> write operation (write shared memory).
>> > Based on the test result, it takes about 30 mins to transfer a 32MB
>> image over eSPI.
>>
>> :( wow, that's unfortunately rather slow.
>>
>> >
>> > Thanks,
>> > Harry
>> > > >
>> > > > On Mon, Sep 9, 2019 at 4:41 AM Harry Sung1 <hsung1@lenovo.com>
>> wrote:
>> > > >>
>> > > >> Hi Patrick,
>> > > >>
>> > > >>
>> > > >>
>> > > >> I found =E2=80=9Cphosphor-ipmi-flash=E2=80=9D have not support fl=
ash over eSPI yet.
>> > > >>
>> > > >> May I ask if you have any plans to support flash over eSPI?
>> > > >>
>> > > >>
>> > > >>
>> > > >> I have done a simple test about shared memory between host and BM=
C
>> :
>> > > >>
>> > > >> The shared memory is work after I set ESPI084 (source address) an=
d
>> ESPI088
>> > > (target address) registers.
>> > > >>
>> > > >> But it has an limitation that only 256 bytes are available on eac=
h
>> page (4KB).
>> > > >>
>> > > >>
>> > > >> For example, if host address starts to write from 0xFE0B0000 (BMC
>> > > >> reserved enough memory already)
>> > > >>
>> > > >> Writable area are:
>> > > >>
>> > > >> 0xFE0B0000 ~ 0xFE0B00FF
>> > > >>
>> > > >> 0xFE0B1000 ~ 0xFE0B10FF
>> > > >>
>> > > >> 0xFE0B2000 ~ 0xFE0B20FF
>> > > >>
>> > > >> 0xFE0B3000 ~ 0xFE0B30FF
>> > > >>
>> > > >> =E2=80=A6
>> > > >>
>> > > >> =E2=80=A6
>> > > >>
>> > > >> =E2=80=A6
>> > > >>
>> > > >>
>> > > >>
>> > > >>
>> > > >>
>> > > >> Thanks,
>> > > >> Harry
>> > >
>> > > Harry, currently there's no plan to implement it as I have no method
>> of testing
>> > > it,  However, it should prove fairly straightforward to add another
>> option to
>> > > the transport mechanism list.  Please let me know if you run into an=
y
>> > > blockers.
>> >
>> > Hi Patrick,
>> > Got it. The better way to set eSPI register is setting them by the
>> driver, right?
>> > For quick validation, I am going to use the " ipmilpc" interface and
>> set necessary eSPI registers manually.
>>
>> I don't know as much about the eSPI variation of this.  ipmilpc uses
>> whatever LPC memory shared option is available (in coordination with
>> the host+bmc).  If eSPI doesn't use the aspeed-lpc-ctrl driver for
>> what it needs, then perhaps a new option should be added ipmiespi?
>>
>> >
>> > Thanks,
>> > Harry
>>
>

--000000000000949b5305925dbe27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Here some more details on how the USB virtual NIC works:<d=
iv><div><span id=3D"gmail-docs-internal-guid-26565387-7fff-97c2-5283-8e01c0=
86a495"><h4 dir=3D"ltr" style=3D"line-height:1.38;margin-top:14pt;margin-bo=
ttom:4pt"><span style=3D"font-size:12pt;font-family:Arial;color:rgb(102,102=
,102);background-color:transparent;font-weight:400;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">Sources</span></h4><ul style=3D"margin-top:0px;margin-bottom:0px"><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a =
href=3D"https://events.static.linuxfound.org/sites/events/files/slides/USB%=
20Gadget%20Configfs%20API_0.pdf" style=3D"text-decoration-line:none"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;text-decoration-line:underline;vertica=
l-align:baseline;white-space:pre-wrap">https://events.static.linuxfound.org=
/sites/events/files/slides/USB%20Gadget%20Configfs%20API_0.pdf</span></a></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><a href=3D"https://developer.toradex.com/knowledge-base/usb-device-m=
ode-(linux)" style=3D"text-decoration-line:none"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;text-decoration-line:underline;vertical-align:baseline;whi=
te-space:pre-wrap">https://developer.toradex.com/knowledge-base/usb-device-=
mode-(linux)</span></a></p></li></ul><br><h4 dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:14pt;margin-bottom:4pt"><span style=3D"font-size:12pt;fo=
nt-family:Arial;color:rgb(102,102,102);background-color:transparent;font-we=
ight:400;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">Build Configuration</span></h4><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">linux/arch/arm/boot/dts/aspeed-=
bmc-[machine].dts</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot=
;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">+&amp;vhub {</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:&quot;Courier New&quot;;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">+ =C2=A0 =C2=A0 =C2=A0 status =3D &quot;=
okay&quot;;</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot;Couri=
er New&quot;;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">+};</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&quot=
;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">+</span></p><br><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">gbmc/[...]/recipes-kernel/linux/linux-aspeed/[machine].cfg</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:&quot;Courier New&quot;;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">+# E=
nable virtual USB NIC</span></p><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:&=
quot;Courier New&quot;;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">+CONFIG_USB_CONFIGFS_ECM=3Dy</span></p><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:&quot;Courier New&quot;;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">+CONFIG_USB_CONFIGF=
S_ECM_SUBSET=3Dy</span></p><br><h4 dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:14pt;margin-bottom:4pt"><span style=3D"font-size:12pt;font-family:=
Arial;color:rgb(102,102,102);background-color:transparent;font-weight:400;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">BMC Runtime Configuration</span></h4><p style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">See attached=C2=A0us=
b_network.sh. This needs to be executed at startup. Obviously, you&#39;ll n=
eed to replace the vendor and product ID as well as the strings with someth=
ing different.</p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><br></p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
">Network configuration needs to go into /etc/systemd/network. See attached=
=C2=A000-bmc-usb0.network.</p><p style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><br></p><h4 dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:14pt;margin-bottom:4pt"><span style=3D"font-size:12pt;font-family:Arial=
;color:rgb(102,102,102);background-color:transparent;font-weight:400;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">Host Runtime Configuration</span></h4><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">As soon as the BMC is booted, the host should see th=
e BMC as an additional USB hub.</span></p><p style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span id=3D"gmail-docs-internal-guid-3081e104=
-7fff-73ee-12d2-13ca308fb39d"><br></span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">The last command on the BMC will cause an actual USB device to be visib=
le to the host. If it does not get auto-loaded, load the cdc_ether driver m=
anually. Once loaded, this adds a &quot;usb0&quot; network interface on the=
 host that can be configured like any other Ethernet device:</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:&quot;Courier New&quot;;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">ifconfig usb=
0 169.254.254.1 netmask 255.255.255.0 up</span></p><p style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><br class=3D"gmail-Apple-interchange=
-newline"></p></span></div><div><br></div><div>From here on you can then ex=
ecute SSH / SCP from the host to the local BMC. However, for=C2=A0phosphor-=
ipmi-flash, it might be better to implement a new TCP-based method right in=
 phosphor-ipmi-flash both on the BMC and the host side. The important bit i=
s that whatever method you use, it must only stage the image to /tmp where=
=C2=A0phosphor-ipmi-flash-bios-verify.target can then pick it up for verifi=
cation. You certainly don&#39;t want to have root-level access from the hos=
t to the BMC as that would allow the host to take ownership of the BMC.</di=
v><div><br></div><div>Oskar.</div><div></div></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 11, 2019 at =
11:23 AM Oskar Senft &lt;<a href=3D"mailto:osk@google.com">osk@google.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr">Hi Harry<br><div><br></div><div>I&#39;ve done some experimen=
ts with the USB virtual NIC on the AST2500 and found that to work rather ni=
cely.</div><div><br></div><div>We&#39;re currently investigating in my team=
 to use that interface as the primary method for transferring data between =
the host and the BMC. From what I can tell, this seems to be the=C2=A0faste=
st, most secure method. The advantage also is that it doesn&#39;t need any =
low-level HW / memory access on the host. However, the host still needs to =
have the USB NIC on its side supported (driver) and configured (IP address)=
. For our environment (Linux), this is easy to achieve.</div><div><br></div=
><div>It should be possible to update the phosphor-ipmi-flash BMC and host =
side implementation to use a USB NIC for data transfer. However, we haven&#=
39;t investigated those details yet.</div><div><br></div><div>Other methods=
 for data transfer (LPC, PCIe, eSPI, SuperI/O) all seem to open up a large =
security hole in the AST2500.</div><div><br></div><div>Oskar.</div><div></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Sep 11, 2019 at 10:45 AM Patrick Venture &lt;<a href=3D"mailto:v=
enture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep 11, 2019=
 at 1:59 AM Harry Sung1 &lt;<a href=3D"mailto:hsung1@lenovo.com" target=3D"=
_blank">hsung1@lenovo.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; &gt; On Mon, Sep 9, 2019 at 7:01 AM Oskar Senft &lt;<a href=3D"mailto:=
osk@google.com" target=3D"_blank">osk@google.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Harry<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What&#39;s the behavior on eSPI? I assume you still have the=
 aspeed-lpc-ctrl<br>
&gt; &gt; enabled, right?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; Oskar.<br>
&gt;<br>
&gt; Hi Oskar,<br>
&gt; Yes, I still enabled the aspeed-lpc-ctrl in my build. Because phosphor=
-ipmi-flash has some mandatory actions on /dev/aspeed-lpc-ctrl before flash=
 (settings for HICR5, HICR7 and HICR8) even though these settings are meani=
ngless for eSPI.<br>
&gt;<br>
&gt; Currently, I set ESPI084 (source address) and ESPI088 (target address)=
 registers manually because linux seems not have a driver can help us to se=
t ESPI084 and ESPI088.<br>
&gt;<br>
&gt; Due to the limitation of AST2500, we can only write 256 bytes in one w=
rite operation (write shared memory).<br>
&gt; Based on the test result, it takes about 30 mins to transfer a 32MB im=
age over eSPI.<br>
<br>
:( wow, that&#39;s unfortunately rather slow.<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Harry<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Sep 9, 2019 at 4:41 AM Harry Sung1 &lt;<a href=3D"ma=
ilto:hsung1@lenovo.com" target=3D"_blank">hsung1@lenovo.com</a>&gt; wrote:<=
br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Hi Patrick,<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I found =E2=80=9Cphosphor-ipmi-flash=E2=80=9D have not s=
upport flash over eSPI yet.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; May I ask if you have any plans to support flash over eS=
PI?<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I have done a simple test about shared memory between ho=
st and BMC :<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; The shared memory is work after I set ESPI084 (source ad=
dress) and ESPI088<br>
&gt; &gt; (target address) registers.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; But it has an limitation that only 256 bytes are availab=
le on each page (4KB).<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; For example, if host address starts to write from 0xFE0B=
0000 (BMC<br>
&gt; &gt; &gt;&gt; reserved enough memory already)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Writable area are:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; 0xFE0B0000 ~ 0xFE0B00FF<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; 0xFE0B1000 ~ 0xFE0B10FF<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; 0xFE0B2000 ~ 0xFE0B20FF<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; 0xFE0B3000 ~ 0xFE0B30FF<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =E2=80=A6<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =E2=80=A6<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =E2=80=A6<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Thanks,<br>
&gt; &gt; &gt;&gt; Harry<br>
&gt; &gt;<br>
&gt; &gt; Harry, currently there&#39;s no plan to implement it as I have no=
 method of testing<br>
&gt; &gt; it,=C2=A0 However, it should prove fairly straightforward to add =
another option to<br>
&gt; &gt; the transport mechanism list.=C2=A0 Please let me know if you run=
 into any<br>
&gt; &gt; blockers.<br>
&gt;<br>
&gt; Hi Patrick,<br>
&gt; Got it. The better way to set eSPI register is setting them by the dri=
ver, right?<br>
&gt; For quick validation, I am going to use the &quot; ipmilpc&quot; inter=
face and set necessary eSPI registers manually.<br>
<br>
I don&#39;t know as much about the eSPI variation of this.=C2=A0 ipmilpc us=
es<br>
whatever LPC memory shared option is available (in coordination with<br>
the host+bmc).=C2=A0 If eSPI doesn&#39;t use the aspeed-lpc-ctrl driver for=
<br>
what it needs, then perhaps a new option should be added ipmiespi?<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Harry<br>
</blockquote></div>
</blockquote></div>

--000000000000949b5305925dbe27--

--000000000000949b5405925dbe29
Content-Type: application/octet-stream; name="00-bmc-usb0.network"
Content-Disposition: attachment; filename="00-bmc-usb0.network"
Content-Transfer-Encoding: base64
Content-ID: <f_k0gx0e800>
X-Attachment-Id: f_k0gx0e800

W01hdGNoXQpOYW1lPXVzYjAKW0FkZHJlc3NdCkFkZHJlc3M9MTY5LjI1NC4yNTQuMjU0LzI0CltO
ZXR3b3JrXQpMaW5rTG9jYWxBZGRyZXNzaW5nPWlwdjYKSVB2NkFjY2VwdFJBPW5vCg==
--000000000000949b5405925dbe29
Content-Type: application/x-shellscript; name="usb_network.sh"
Content-Disposition: attachment; filename="usb_network.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_k0gx0e8c1>
X-Attachment-Id: f_k0gx0e8c1

IyEvYmluL2Jhc2gKCiMgQWRhcHRlZCBmcm9tIHVwc3RyZWFtIHNjcmlwdDoKIyBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9tZXRhLXF1YW50YS9ibG9iLzQxZmY1NDYwNWE4ZGY2ZTQ1NmUyMDM1
YjQxMDExNDU0NWJjOTQyODQvbWV0YS1nc2ovcmVjaXBlcy1waG9zcGhvci91c2ItbmV0d29yay9m
aWxlcy91c2JfbmV0d29yay5zaAoKZnVuY3Rpb24gc3RhcnQoKSB7CiAgaWYgW1sgISAtZCBnMSBd
XTsgdGhlbgogICAgbWtkaXIgZzEKICBmaQoKICBjZCBnMQoKICAjIFRPRE86IFVwZGF0ZSBWSUQg
YW5kIFBJRAogIGVjaG8gMHgxMjA5ID4gaWRWZW5kb3IKICBlY2hvIDB4MTIzNCA+IGlkUHJvZHVj
dAoKICBpZiBbWyAhIC1kIHN0cmluZ3MvMHg0MDkgXV07IHRoZW4KICAgIG1rZGlyIC1wIHN0cmlu
Z3MvMHg0MDkKICBmaQogIGVjaG8gIk15IE5hbWUiID4gc3RyaW5ncy8weDQwOS9tYW51ZmFjdHVy
ZXIKICBlY2hvICJNeSBQcm9kdWN0IiA+IHN0cmluZ3MvMHg0MDkvcHJvZHVjdAoKICBpZiBbWyAh
IC1kIGNvbmZpZ3MvYy4xIF1dOyB0aGVuCiAgICBta2RpciAtcCBjb25maWdzL2MuMQogIGZpCiAg
ZWNobyAxMDAgPiBjb25maWdzL2MuMS9NYXhQb3dlcgogIGlmIFtbICEgLWQgY29uZmlncy9jLjEv
c3RyaW5ncy8weDQwOSBdXTsgdGhlbgogICAgbWtkaXIgLXAgY29uZmlncy9jLjEvc3RyaW5ncy8w
eDQwOQogIGZpCiAgZWNobyAiRUNNIiA+IGNvbmZpZ3MvYy4xL3N0cmluZ3MvMHg0MDkvY29uZmln
dXJhdGlvbgoKICBpZiBbWyAhIC1kIGZ1bmN0aW9ucy9lY20udXNiMCBdXTsgdGhlbgogICAgbWtk
aXIgLXAgZnVuY3Rpb25zL2VjbS51c2IwCiAgZmkKCiAgaWYgW1sgISAtTCBjb25maWdzL2MuMS9l
Y20udXNiMCBdXTsgdGhlbgogICAgIyBUT0RPOgogICAgIyBNQUMgYWRkcmVzc2VzIGdlbmVyYXRl
ZCBhdCByYW5kb20gdXNpbmcKICAgICMgaHR0cHM6Ly93d3cuYnJvd3NlcmxpbmcuY29tL3Rvb2xz
L3JhbmRvbS1tYWMKICAgIGVjaG8gYTI6ZTk6ZmE6ODY6MjU6YWMgPiBmdW5jdGlvbnMvZWNtLnVz
YjAvZGV2X2FkZHIKICAgIGVjaG8gYTg6NGE6MDQ6ZTg6MDk6OTYgPiBmdW5jdGlvbnMvZWNtLnVz
YjAvaG9zdF9hZGRyCgogICAgbG4gLXMgZnVuY3Rpb25zL2VjbS51c2IwIGNvbmZpZ3MvYy4xCiAg
ZmkKCiAgaWYgW1sgLXogIiQoY2F0IFVEQykiIF1dOyB0aGVuCiAgICBlY2hvICIxZTZhMDAwMC51
c2Itdmh1YjpwMSIgPiBVREMKICBmaQp9CgpmdW5jdGlvbiBybWRpcl9pZl9leGlzdHMgewogIGlm
IFtbIC1kICIkMSIgXV07IHRoZW4KICAgIHJtZGlyICIkMSIKICBmaQp9CgpmdW5jdGlvbiBzdG9w
KCkgewogIGlmIFtbIC1kIGcxIF1dOyB0aGVuCiAgICBjZCBnMQogICAgcm0gLWYgY29uZmlncy9j
LjEvZWNtLnVzYjAKICAgIHJtZGlyX2lmX2V4aXN0cyBjb25maWdzL2MuMS9zdHJpbmdzLzB4NDA5
CiAgICBybWRpcl9pZl9leGlzdHMgY29uZmlncy9jLjEKICAgIHJtZGlyX2lmX2V4aXN0cyBzdHJp
bmdzLzB4NDA5CiAgICBybWRpcl9pZl9leGlzdHMgZnVuY3Rpb25zL2VjbS51c2IwCiAgICBjZCAu
LgogICAgcm1kaXIgZzEKICBmaQp9CgpjZCAvc3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldApp
ZiBbWyAiJDEiID09ICJzdG9wIiBdXTsgdGhlbgogIHN0b3AKZWxzZQogIHN0YXJ0CmZpCg==
--000000000000949b5405925dbe29--
