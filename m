Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099A56C81
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 16:45:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ym6f0L1gzDqXK
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 00:45:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CedI6tR8"; 
 dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ym5H02z3zDqVn
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 00:44:32 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id i189so1468148pfg.10
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YDW354TNennGhXjvjwPSyMY7sl9YP51Sc8PUudF291U=;
 b=CedI6tR8H28xjiyoL8r9ar9PS4t9LOOlBqOg0qXIvWgEMjeOa7yur2RljKZ7DVT/BM
 lrwbV+g5AS/Hn4k5KT0Peb/GABAqd9LRUm95DsviyOP68c/lOKRzbxO5Nz7JbGyeiC6n
 snQsz97iAw6xM4rMsng5KBQVihmp6vlgmy1f1idstBxU/vZa2XqdXWpGiqIN304Psjz2
 BIKfMNfYDjfuQh4Zr+Aw1yuD5ipu0EqmLcb/xp9upNieiN2YDIgpgNc/PSXcUWgArmzM
 M9uZsx9q4pOPbBANyra2AI5cgWblt+G8NEKzZm4FMH1Wd49RKtfum48pHX/v3zL+3H6A
 sr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDW354TNennGhXjvjwPSyMY7sl9YP51Sc8PUudF291U=;
 b=TDbcepYJS40yGZjpBl11AQFM51X3OXVlY5HNvaz5RHjA/VmUNpQs11oYT0xOt+cZfm
 XlqQHqhZSYOXh+sH0LIAUybIjL7Z+LJ3F05fIreTlKPIyuYqyz52E2djh1Ku0fCey4HT
 bZRzGjHEctOgmPlfOdUBsiBF7eDWCDeHi4R7i3AqI4KMtekAjQSNULJNft8euKl6I9ca
 SaLscwtXoaEtuqZv24JydIIpSNuhel/WqrGNPT6/Qes2s2GN/HEFo33oykB8tqKmMLnd
 D3/CVS/4F1LLWy40ZtrjSHXmhPvQU48Nom0v78FuJWaI5BX6Lbu1a3B7YNEYlVL31d2U
 pEFw==
X-Gm-Message-State: APjAAAVBUAbiM2nMrWKlF+FVHwZGXkLeNpLFni2YNiKpL1WhwK8qQNIq
 tHmOS2pHdbpUBQVfRfDjD79rkikL6v05XFfozmGh5Q==
X-Google-Smtp-Source: APXvYqzNbaj8InNS6EiBEAVHsHEINm5qbHjdliDIYwHwG2ea5bejX1b3JpICoH60ElY+QOaiLByTVM730NkubVQfiK8=
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr4916361pjs.55.1561560268468; 
 Wed, 26 Jun 2019 07:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <26428e13a88d4ea7bcee9c792b892c7c@lenovo.com>
In-Reply-To: <26428e13a88d4ea7bcee9c792b892c7c@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 26 Jun 2019 07:44:17 -0700
Message-ID: <CAO=notyr4whyR8TN5awOVTTrQDMU8kXQYiqBAOUR_fU3dZo0cg@mail.gmail.com>
Subject: Re: Clarify some questions about in-band firmware update
To: Andrew MS1 Peng <pengms1@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001970e7058c3b1586"
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
Cc: Adriana Kobylak <anoo@us.ibm.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001970e7058c3b1586
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 4:28 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:

> Hi Patrick,
>
>
>
> I have some questions as below, could you help to clarify. Thanks.
>
> 1.      Do you have any plans to support BIOS update in
> phosphor-ipmi-flash?
>
> If the answer is no, we would like to help to add this feature. Could you
> give us some advice or clues to implement it.
>

This could be added to the design (first step).
I could probably roll out this in a day or two, it's not a difficult
extension with a few caveats. We'd have to define new services, such as
update_bios.service instead of update_bmc.service.

I have some cycles, so I don't mind reviewing the changes required and
rolling something out --


> 2.      The FPGA rom image is embedded in BMC image, we would like to add
> fpga-update.service and fpga-verify.service in phosphor-ipmi-flash, we
> expect that run both services after update BMC image completely. Do you
> have any concerns about it?
>

There are a couple things to unpack here.  The FPGA rom is embedded in the
BMC image.  How is the BMC updated?  I ask because a machine can (and is
expected to) provide its own update_bmc.service implementation.  This
service could trigger the fpga-verify and fpga-update services within
whatever code is called from the update_bmc service you specify.


> 3.      How can I make a static executable host tool (burn_my_bmc)?
> Currently, I can=E2=80=99t to make a *statically linked binary successful=
ly*, but
> I have made it before you added p2a function.
>
For the host tool you need to specify very little, you should be able to
build it via:
./bootstrap.sh
./configure
./make

You will need to checkout and install ipmi-blob-tool first
(openbmc/ipmi-blob-tool)


^^ --- those steps should go on the README.  Will add them shortly.


> Based on different OS environment as below, I would like to have a static
> executable since *dynamically linked binary can=E2=80=99t work normally i=
n host
> OS.*
>
> Host OS environment
>
> Build environment (OpenBmc)
>
> Gcc  v4.8.5
>
> Gcc   v8.3.0
>
> Glibc  v2.17
>
> Glibc  v2.29
>

The bitbake recipe isn't meant to be used for the host tool.  It explicitly
disables building the host-tool by default.  You should be able to check
out the repo and build from there.  Let me know if you run into issues with
that.


> 4.      I didn=E2=80=99t find the below service files in source tree, whe=
re can
> find default services or should we provide our own services?
>
> update_bmc.service
> verify_image.service
>
> prepare_update.service
>

That's correct.  There are currently no default service files.  I am
thinking of providing a default prepare_update service in a later CL,
however updating the BMC or verifying the image depend entirely on the
system -- which makes it difficult to have a default.  In point of fact,
there isn't really a valid default phosphor-ipmi-flash build for a BMC.
Everything needs to be specified.

^--- I can work on making the ubi bmc option available if the ubi distro
feature is enabled, etc -- providing some defaults.
^--- I have a plan to provide a prepare_update.service once I finish
testing Aspeed LPC support.


>
>
>
>
> Regards,
> Andrew
>

--0000000000001970e7058c3b1586
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 26, 2019 at 4:28 AM Andre=
w MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com">pengms1@lenovo.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_-7106965077525685122WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif">Hi Patrick,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif;color:black">I have some questions as below, could =
you help to clarify. Thanks.<u></u><u></u></span></p>
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif;color:black"><span>1.<span style=3D"font:7pt &quot;Times New Roman&=
quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:12pt;fo=
nt-family:Calibri,sans-serif;color:black">Do you have any plans to support =
BIOS update in phosphor-ipmi-flash?<u></u><u></u></span></p>
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm"><span lang=3D"EN-US" style=3D"font-size:12pt;font=
-family:Calibri,sans-serif;color:black">If the answer is no, we would like =
to help to add this feature. Could
 you give us some advice or clues to implement it.</span></p></div></div></=
blockquote><div><br></div><div>This could be added to the design (first ste=
p).</div><div>I could probably roll out this in a day or two, it&#39;s not =
a difficult extension with a few caveats. We&#39;d have to define new servi=
ces, such as update_bios.service instead=C2=A0of update_bmc.service.</div><=
div><br></div><div>I have some cycles, so I don&#39;t mind reviewing the ch=
anges required and rolling something out --=C2=A0</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div cla=
ss=3D"gmail-m_-7106965077525685122WordSection1"><p class=3D"gmail-m_-710696=
5077525685122MsoListParagraph" style=3D"margin-left:18pt;text-indent:0cm"><=
span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,sans-serif;=
color:black"><u></u><u></u></span></p>
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif;color:black"><span>2.<span style=3D"font:7pt &quot;Times New Roman&=
quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:12pt;fo=
nt-family:Calibri,sans-serif;color:black">The FPGA rom image is embedded in=
 BMC image, we would like to add fpga-update.service and fpga-verify.servic=
e
 in phosphor-ipmi-flash, we expect that run both services after update BMC =
image completely. Do you have any concerns about it?</span></p></div></div>=
</blockquote><div><br></div><div>There are a couple things to unpack here.=
=C2=A0 The FPGA rom is embedded in the BMC image.=C2=A0 How is the BMC upda=
ted?=C2=A0 I ask because a machine can (and is expected to) provide its own=
 update_bmc.service implementation.=C2=A0 This service could trigger the fp=
ga-verify and fpga-update services within whatever code is called from the =
update_bmc service you specify.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"gmail-m_-710=
6965077525685122WordSection1"><p class=3D"gmail-m_-7106965077525685122MsoLi=
stParagraph" style=3D"margin-left:18pt"><span lang=3D"EN-US" style=3D"font-=
size:12pt;font-family:Calibri,sans-serif;color:black"><u></u><u></u></span>=
</p>
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif;color:black"><span>3.<span style=3D"font:7pt &quot;Times New Roman&=
quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:12pt;fo=
nt-family:Calibri,sans-serif;color:black">How can I make a static executabl=
e host tool (burn_my_bmc)? Currently, I can=E2=80=99t to make a
</span><em><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri=
,sans-serif;color:black;background:white;font-style:normal">statically link=
ed binary successfully</span></em><span lang=3D"EN-US" style=3D"font-size:1=
2pt;font-family:Calibri,sans-serif;color:black">,
 but I have made it before you added p2a function.</span></p></div></div></=
blockquote><div>For the host tool you need to specify very little, you shou=
ld be able to build it via:</div><div>./bootstrap.sh<br></div><div>./config=
ure</div><div>./make</div><div><br></div><div>You will need to checkout and=
 install ipmi-blob-tool first (openbmc/ipmi-blob-tool)</div><div><br></div>=
<div><br></div><div>^^ --- those steps should go on the README.=C2=A0 Will =
add them shortly.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"gmail-m_-71069650775256851=
22WordSection1"><p class=3D"gmail-m_-7106965077525685122MsoListParagraph" s=
tyle=3D"margin-left:18pt"><span lang=3D"EN-US" style=3D"font-size:12pt;font=
-family:Calibri,sans-serif;color:black"> <u></u><u></u></span></p>
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm"><span lang=3D"EN-US" style=3D"font-size:12pt;font=
-family:Calibri,sans-serif;color:black">Based on different OS
</span><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif">environment as below,
<span style=3D"color:black">I would like to have a static executable since =
</span></span><em><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:=
Calibri,sans-serif;color:black;background:white;font-style:normal">dynamica=
lly linked binary can=E2=80=99t work normally
 in host OS.</span></em><span lang=3D"EN-US" style=3D"font-size:12pt;font-f=
amily:Calibri,sans-serif;color:black"><u></u><u></u></span></p>
<table class=3D"gmail-m_-7106965077525685122MsoTableGrid" border=3D"1" cell=
spacing=3D"0" cellpadding=3D"0" style=3D"margin-left:18pt;border-collapse:c=
ollapse;border:none">
<tbody>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border:1pt solid w=
indowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"text-ind=
ent:0cm"><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,s=
ans-serif">Host OS environment<u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"text-ind=
ent:0cm"><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,s=
ans-serif">Build environment (OpenBmc)<u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"text-ind=
ent:0cm"><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,s=
ans-serif">Gcc=C2=A0 v4.8.5<u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"text-ind=
ent:0cm"><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,s=
ans-serif">Gcc=C2=A0=C2=A0 v8.3.0<u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"text-ind=
ent:0cm"><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,s=
ans-serif">Glibc=C2=A0 v2.17<u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"text-ind=
ent:0cm"><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,s=
ans-serif">Glibc=C2=A0 v2.29<u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table></div></div></blockquote><div><br></div><div>The bitbake recipe isn=
&#39;t meant to be used for the host tool.=C2=A0 It explicitly disables bui=
lding the host-tool by default.=C2=A0 You should be able to check out the r=
epo and build from there.=C2=A0 Let me know if you run into issues with tha=
t.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div lang=3D"ZH-CN"><div class=3D"gmail-m_-7106965077525685122WordSecti=
on1">
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif"><span>4.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:12pt;fo=
nt-family:Calibri,sans-serif">I didn=E2=80=99t find the below service files=
 in source tree, where can find default services or should we provide our o=
wn services?
<u></u><u></u></span></p>
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm"><code><span lang=3D"EN-US" style=3D"font-size:12p=
t;font-family:Calibri,sans-serif">update_bmc.service</span></code><span lan=
g=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,sans-serif"><br>
<code><span style=3D"font-family:Calibri,sans-serif">verify_image.service</=
span></code></span><span lang=3D"EN-US" style=3D"font-size:12pt;font-family=
:Calibri,sans-serif"><u></u><u></u></span></p>
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm"><code><span lang=3D"EN-US" style=3D"font-size:12p=
t;font-family:Calibri,sans-serif">prepare_update.service</span></code></p><=
/div></div></blockquote><div><br></div><div>That&#39;s correct.=C2=A0 There=
 are currently no default service files.=C2=A0 I am thinking of providing a=
 default prepare_update service in a later CL, however updating the BMC or =
verifying the image depend entirely on the system -- which makes it difficu=
lt to have a default.=C2=A0 In point of fact, there isn&#39;t really a vali=
d default phosphor-ipmi-flash build for a BMC.=C2=A0 Everything needs to be=
 specified.</div><div><br></div><div>^--- I can work on making the ubi bmc =
option available if the ubi distro feature is enabled, etc -- providing som=
e defaults.</div><div>^--- I have a plan to provide a prepare_update.servic=
e once I finish testing Aspeed LPC support.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"=
gmail-m_-7106965077525685122WordSection1"><p class=3D"gmail-m_-710696507752=
5685122MsoListParagraph" style=3D"margin-left:18pt;text-indent:0cm"><code><=
span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,sans-serif"=
><u></u><u></u></span></code></p>
<p class=3D"gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif">Regards,<br>
Andrew<u></u><u></u></span></p>
</div>
</div>

</blockquote></div></div>

--0000000000001970e7058c3b1586--
