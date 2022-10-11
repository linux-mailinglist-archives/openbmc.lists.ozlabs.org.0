Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B25FBA58
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 20:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mn45c2ykQz3br0
	for <lists+openbmc@lfdr.de>; Wed, 12 Oct 2022 05:27:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c1pAhCkF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=icepbix@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c1pAhCkF;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mn4501WDWz2xKN
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 05:27:15 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id a3so22970452wrt.0
        for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qT8NmSUFBUDbHI0tRTV0L9jhzs+KKKzgCqnycW2DWTg=;
        b=c1pAhCkFnduUCl+7cHdh3ofWzkoctr1zjVpwQNj2h8O7OfhpRhZAe1VMNvndVxG1xC
         7MSt1OaV32qm5JzFbrGdllUnZvKv7zNd/rRuA2UYWkoTk8PDDC2zVwACp/FOMsJ+mhuN
         8LAI8oeo6hxfVL/igpAkmrD/K4Jwn7oCU1pM/K7unAsVN76L17XLymbRekJ33WOXYYkw
         +X+bSPw8iX9RfLYJW4lCR8WAcTjm7R9oJPsvmwuU3NKd5DytwNX+30wG5QXG5RkG1OJb
         TV+MSZ+Ast42WiPIQhEL3XC470f9+IpuLhzhhqaXJSZVptPx3FbNCXoq0I0EPT/QFUdd
         xtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qT8NmSUFBUDbHI0tRTV0L9jhzs+KKKzgCqnycW2DWTg=;
        b=tkRhN5QQB1NIACMOCW4p7uyahwL+rfBx7keGHdv+4rPQbPFFnrLWhXbocj7PWpHxcf
         VQtEypPtu4eBp2q5+CvSmpLsVqPW74qmkJuNB5b4jO9UPrxXYxbq+i7x3XAu6FN3VNb3
         KA1sKqdVRSfZ56d0gEwpjacCTalQrk6yhowcgIEgx4yXDm7CvqHmLkkUuzMQXsY7FjQZ
         26R4quQddI7/zmFtypg8Qk7b7bHda0YD+PlS9Ayfcxeao+ZAVwSAf3+IvRP6mcFSm2rF
         1kqyvjO+d19esRXYGZt027wVlxZLJQSIFrQsgvAI17PW9JpDQ1UXZaVqaH/6HdDSvl7N
         kbfA==
X-Gm-Message-State: ACrzQf1Gk2NeWBMwygmv+Aq33G5AxC7ECyBSPXhw6pLvdEDqM71iITuo
	eVLbBcifF0BlLhhj/KcUktouMN7BhQuwTmSbUgk=
X-Google-Smtp-Source: AMsMyM5jbzr9rIBZuKuA5h6MuWeYP6k8c9JqBa9uRRFozH0j27ylXTzTHvYZHMJt3RaHzp30nPtbLU6iDNO+3GaaxH8=
X-Received: by 2002:a5d:5a11:0:b0:22e:3ed1:e426 with SMTP id
 bq17-20020a5d5a11000000b0022e3ed1e426mr15808947wrb.642.1665512826960; Tue, 11
 Oct 2022 11:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAJewAaLk0Q9fnmT_s_8TdnDfcJMXbLcS4=OZoeT5+qatDnGFKQ@mail.gmail.com>
 <Y0VBEZnddPlHT3cW@home.paul.comp>
In-Reply-To: <Y0VBEZnddPlHT3cW@home.paul.comp>
From: Nikita Pavlov <icepbix@gmail.com>
Date: Tue, 11 Oct 2022 21:26:55 +0300
Message-ID: <CAJewAaLvsBAB08T0BS07AKM18b+5ZPe764-t2p9FK6KrFh6RvQ@mail.gmail.com>
Subject: Re: how get smbios blob with intel-ipmi-oem
To: Paul Fertser <fercerpav@gmail.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000006b861605eac66c2c"
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

--0000000000006b861605eac66c2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
Thanks for your response.

I request to this <Intel General Application>:<Get NIC Info> for test.

Now I have some compile errors this
https://github.com/Intel-BMC/provingground/tree/master/services/smbios
...
In file included from /home/qs/provingground/services/smbios/src/cpu.cpp:17=
:
/home/qs/provingground/services/smbios/src/cpu.hpp:111:17: error:
=E2=80=98std::string phosphor::smbios::Cpu::processorSocket(std::string)=E2=
=80=99 marked
=E2=80=98override=E2=80=99, but does not override
  111 |     std::string processorSocket(std::string value) override;
...
/home/qs/provingground/services/smbios/src/cpu.cpp: In member function
=E2=80=98std::string phosphor::smbios::Cpu::processorSocket(std::string)=E2=
=80=99:
/home/qs/provingground/services/smbios/src/cpu.cpp:38:9: error:
=E2=80=98processorSocket=E2=80=99 is not a member of
=E2=80=98sdbusplus::xyz::openbmc_project::Inventory::Item::server::Cpu=E2=
=80=99
   38 |         processorSocket(value);
...
And other typical errors.

I'll fix them and post my progress.



=D0=B2=D1=82, 11 =D0=BE=D0=BA=D1=82. 2022 =D0=B3. =D0=B2 13:10, Paul Fertse=
r <fercerpav@gmail.com>:

> Hi Nikita,
>
> On Tue, Oct 11, 2022 at 12:27:58PM +0300, Nikita Pavlov wrote:
> > Now I work with intel-ipmi-oem and want to get smbios blob.
>
> If you're going to use MDRv1 protocol then I can share the experience.
>
> We use intel-ipmi-oem and it handles requests like 0x3e:0x20 (for
> region status) by calling methods of a D-Bus object, which you should
> also be able to query manually following
>
> busctl introspect xyz.openbmc_project.Smbios.MDR_V1
> /xyz/openbmc_project/Smbios/MDR_V1
>
> output.
>
> "xyz.openbmc_project.Smbios.MDR_V1" is handled by
> https://github.com/Intel-BMC/provingground/tree/master/services/smbios .
>
> Example of requesting status of the first region:
>
> # ipmitool raw 0x3e 0x20 1
>  11 01 01 02 00 00 80 cc 0a 91
>
> > I use intel-ipmi-oem lib and ipmi-whitelist.conf with
> phosphor-host-ipmid.
> > I test this by ipmitool like this ipmitool raw 0x30 0x1a and get:
>
> Why are you using 0x30 0x1a, it seems to be
> <Intel General Application>:<Get NIC Info> so completely unrelated?
>
> HTH
> --
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com
>

--0000000000006b861605eac66c2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<div>Thanks for your response.</div><div><br></div=
><div>I request to this &lt;Intel General Application&gt;:&lt;Get NIC Info&=
gt; for test.</div><div><br></div><div>Now I have some compile errors this=
=C2=A0<a href=3D"https://github.com/Intel-BMC/provingground/tree/master/ser=
vices/smbios" rel=3D"noreferrer" target=3D"_blank">https://github.com/Intel=
-BMC/provingground/tree/master/services/smbios</a>=C2=A0</div><div>...</div=
><div>In file included from /home/qs/provingground/services/smbios/src/cpu.=
cpp:17:<br>/home/qs/provingground/services/smbios/src/cpu.hpp:111:17: error=
: =E2=80=98std::string phosphor::smbios::Cpu::processorSocket(std::string)=
=E2=80=99 marked =E2=80=98override=E2=80=99, but does not override<br>=C2=
=A0 111 | =C2=A0 =C2=A0 std::string processorSocket(std::string value) over=
ride;<br></div><div>...</div><div>/home/qs/provingground/services/smbios/sr=
c/cpu.cpp: In member function =E2=80=98std::string phosphor::smbios::Cpu::p=
rocessorSocket(std::string)=E2=80=99:<br>/home/qs/provingground/services/sm=
bios/src/cpu.cpp:38:9: error: =E2=80=98processorSocket=E2=80=99 is not a me=
mber of =E2=80=98sdbusplus::xyz::openbmc_project::Inventory::Item::server::=
Cpu=E2=80=99<br>=C2=A0 =C2=A038 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 processorSock=
et(value);<br></div><div>...</div><div>And other typical errors.</div><div>=
<br></div><div>I&#39;ll fix them and post my progress.</div><div><br></div>=
<div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">=D0=B2=D1=82, 11 =D0=BE=D0=BA=D1=82. 2022 =D0=B3. =D0=B2 13=
:10, Paul Fertser &lt;<a href=3D"mailto:fercerpav@gmail.com">fercerpav@gmai=
l.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i Nikita,<br>
<br>
On Tue, Oct 11, 2022 at 12:27:58PM +0300, Nikita Pavlov wrote:<br>
&gt; Now I work with intel-ipmi-oem and want to get=C2=A0smbios blob.=C2=A0=
<br>
<br>
If you&#39;re going to use MDRv1 protocol then I can share the experience.<=
br>
<br>
We use intel-ipmi-oem and it handles requests like 0x3e:0x20 (for<br>
region status) by calling methods of a D-Bus object, which you should<br>
also be able to query manually following<br>
<br>
busctl introspect xyz.openbmc_project.Smbios.MDR_V1 /xyz/openbmc_project/Sm=
bios/MDR_V1<br>
<br>
output.<br>
<br>
&quot;xyz.openbmc_project.Smbios.MDR_V1&quot; is handled by<br>
<a href=3D"https://github.com/Intel-BMC/provingground/tree/master/services/=
smbios" rel=3D"noreferrer" target=3D"_blank">https://github.com/Intel-BMC/p=
rovingground/tree/master/services/smbios</a> .<br>
<br>
Example of requesting status of the first region:<br>
<br>
# ipmitool raw 0x3e 0x20 1<br>
=C2=A011 01 01 02 00 00 80 cc 0a 91<br>
<br>
&gt; I use intel-ipmi-oem lib and ipmi-whitelist.conf with phosphor-host-ip=
mid.<br>
&gt; I test this by ipmitool like this ipmitool raw 0x30 0x1a and get:<br>
<br>
Why are you using 0x30 0x1a, it seems to be<br>
&lt;Intel General Application&gt;:&lt;Get NIC Info&gt; so completely unrela=
ted?<br>
<br>
HTH<br>
-- <br>
Be free, use free (<a href=3D"http://www.gnu.org/philosophy/free-sw.html" r=
el=3D"noreferrer" target=3D"_blank">http://www.gnu.org/philosophy/free-sw.h=
tml</a>) software!<br>
mailto:<a href=3D"mailto:fercerpav@gmail.com" target=3D"_blank">fercerpav@g=
mail.com</a><br>
</blockquote></div>

--0000000000006b861605eac66c2c--
