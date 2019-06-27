Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 769815792E
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 03:59:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z34C6d40zDqdr
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 11:59:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sjxv0N8C"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z33V3dhWzDqW1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 11:59:01 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id m4so250737pgk.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 18:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=93Hs5Y70oIVFwfQG3EqY7Hkn14p8/IKqyCfu7lz9czY=;
 b=sjxv0N8CWam+AplvMNyp9SgL6bc8109mbSnqzaK608mpd+dYMVWRrs2ev0FJv0Ckmc
 J3e6+XAkMULeTNEQgNF3YWQY1P9ujSpBmES8FjKCalfFjdzzwWWzu0pnjZ1IdVCtQ6rq
 w/fex9RGBgrTNGf7fT9SiK3gp/2HiXquDxAH27gHDNoLYXBbIPzTRWXOhdRNZ8p2ncoI
 o6kuEKjZfQ2mlZE2PdKGZHSQshtABx76LqGXxk4x8UFhKncEM7fEpfAFGpa0y5JBvv1+
 5JZ+OYYD3wNSYMTcmj89PDFBgiix1c3edhsVCrJtptDw9P6iE5S43jAxa5imoZ41aUCJ
 5QHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=93Hs5Y70oIVFwfQG3EqY7Hkn14p8/IKqyCfu7lz9czY=;
 b=W/JJ70xrqqxPFOiMZyxbyQ3AZ0fNNaQxiy5gNvj7klkGzSOr2p3WklceCX/fjC7L+f
 3yqR8Hz51K3/M+CFijHcY6Ltu48D2oUvZUX9hXFVg6cILs9J1pU6KaL1OYhYTp6Y6en2
 io4kaKn4qtm7R4VvbVfxi5+TLjRQkYKP4Ol2dv5/ujn/YNh4YxB46/Fm7QY+gQjrCstl
 NU1m87o+Epl11pdOXVzGw0vubhZQtWDHn1exNkfNGm2UfvnYvYuRP5UtgPgCpjFPmL0E
 nFyY55ZuPHwlx9DjOfiXnMRQc9MhMpkwyX/0l/t5FPlu+t7Ox1AeNlXpfF0s8Ncj+1fr
 vK4g==
X-Gm-Message-State: APjAAAUq3mZySKiVQRGQlUdrwFDA2AcLIljk/sjTgqkzSxO9ApuCPyQH
 8RPwxoQeWi0m0EhtT3I1VD99C5/MtmmiKqyqiKwNhg==
X-Google-Smtp-Source: APXvYqzrwISnY0Tg7caaPvN10er7WPs196Jz3k3vebcCtcdi3cmFFZVIUJhD8S1+yKnNIe9gDCC72JgF/ZZfhZQUr6k=
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr1073855pgb.353.1561600737457; 
 Wed, 26 Jun 2019 18:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <26428e13a88d4ea7bcee9c792b892c7c@lenovo.com>
 <CAO=notyr4whyR8TN5awOVTTrQDMU8kXQYiqBAOUR_fU3dZo0cg@mail.gmail.com>
In-Reply-To: <CAO=notyr4whyR8TN5awOVTTrQDMU8kXQYiqBAOUR_fU3dZo0cg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 26 Jun 2019 18:58:46 -0700
Message-ID: <CAO=notwh-2iLhAMHbXd8RzvbBgZWAMLkAwGSLwoPyhL=+SAp8g@mail.gmail.com>
Subject: Re: Clarify some questions about in-band firmware update
To: Andrew MS1 Peng <pengms1@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000003d464e058c4481d5"
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

--0000000000003d464e058c4481d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 7:44 AM Patrick Venture <venture@google.com> wrote:

>
>
> On Wed, Jun 26, 2019 at 4:28 AM Andrew MS1 Peng <pengms1@lenovo.com>
> wrote:
>
>> Hi Patrick,
>>
>>
>>
>> I have some questions as below, could you help to clarify. Thanks.
>>
>> 1.      Do you have any plans to support BIOS update in
>> phosphor-ipmi-flash?
>>
>> If the answer is no, we would like to help to add this feature. Could yo=
u
>> give us some advice or clues to implement it.
>>
>
> This could be added to the design (first step).
> I could probably roll out this in a day or two, it's not a difficult
> extension with a few caveats. We'd have to define new services, such as
> update_bios.service instead of update_bmc.service.
>
> I have some cycles, so I don't mind reviewing the changes required and
> rolling something out --
>
>
>> 2.      The FPGA rom image is embedded in BMC image, we would like to
>> add fpga-update.service and fpga-verify.service in phosphor-ipmi-flash, =
we
>> expect that run both services after update BMC image completely. Do you
>> have any concerns about it?
>>
>
> There are a couple things to unpack here.  The FPGA rom is embedded in th=
e
> BMC image.  How is the BMC updated?  I ask because a machine can (and is
> expected to) provide its own update_bmc.service implementation.  This
> service could trigger the fpga-verify and fpga-update services within
> whatever code is called from the update_bmc service you specify.
>
>
>> 3.      How can I make a static executable host tool (burn_my_bmc)?
>> Currently, I can=E2=80=99t to make a *statically linked binary successfu=
lly*,
>> but I have made it before you added p2a function.
>>
> For the host tool you need to specify very little, you should be able to
> build it via:
> ./bootstrap.sh
> ./configure
> ./make
>
> You will need to checkout and install ipmi-blob-tool first
> (openbmc/ipmi-blob-tool)
>
>
> ^^ --- those steps should go on the README.  Will add them shortly.
>
>
>> Based on different OS environment as below, I would like to have a
>> static executable since *dynamically linked binary can=E2=80=99t work no=
rmally
>> in host OS.*
>>
>> Host OS environment
>>
>> Build environment (OpenBmc)
>>
>> Gcc  v4.8.5
>>
>> Gcc   v8.3.0
>>
>> Glibc  v2.17
>>
>> Glibc  v2.29
>>
>
> The bitbake recipe isn't meant to be used for the host tool.  It
> explicitly disables building the host-tool by default.  You should be abl=
e
> to check out the repo and build from there.  Let me know if you run into
> issues with that.
>
>
>> 4.      I didn=E2=80=99t find the below service files in source tree, wh=
ere can
>> find default services or should we provide our own services?
>>
>> update_bmc.service
>> verify_image.service
>>
>> prepare_update.service
>>
>
> That's correct.  There are currently no default service files.  I am
> thinking of providing a default prepare_update service in a later CL,
> however updating the BMC or verifying the image depend entirely on the
> system -- which makes it difficult to have a default.  In point of fact,
> there isn't really a valid default phosphor-ipmi-flash build for a BMC.
> Everything needs to be specified.
>
> ^--- I can work on making the ubi bmc option available if the ubi distro
> feature is enabled, etc -- providing some defaults.
> ^--- I have a plan to provide a prepare_update.service once I finish
> testing Aspeed LPC support.
>
>

I've been reviewing the build process for the host-tool and the configure
file and other pieces require the BMC-stuff to be installed first
(sdbusplus, etc).  I'm going to cleanup the configure file so that if
you're building the host-tool it doesn't try to build the BMC stuff.

>
>>
>>
>>
>> Regards,
>> Andrew
>>
>

--0000000000003d464e058c4481d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 26, 2019 at 7:44 AM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 26, 2019 at 4:28 AM Andrew MS=
1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank">pengms1@=
lenovo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122WordS=
ection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif">Hi Patrick,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif;color:black">I have some questions as below, could =
you help to clarify. Thanks.<u></u><u></u></span></p>
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif;color:black"><span>1.<span style=3D"font:7pt &quot;Times New Roman&=
quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:12pt;fo=
nt-family:Calibri,sans-serif;color:black">Do you have any plans to support =
BIOS update in phosphor-ipmi-flash?<u></u><u></u></span></p>
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt;text-indent:0cm"><span lang=3D"EN-US" =
style=3D"font-size:12pt;font-family:Calibri,sans-serif;color:black">If the =
answer is no, we would like to help to add this feature. Could
 you give us some advice or clues to implement it.</span></p></div></div></=
blockquote><div><br></div><div>This could be added to the design (first ste=
p).</div><div>I could probably roll out this in a day or two, it&#39;s not =
a difficult extension with a few caveats. We&#39;d have to define new servi=
ces, such as update_bios.service instead=C2=A0of update_bmc.service.</div><=
div><br></div><div>I have some cycles, so I don&#39;t mind reviewing the ch=
anges required and rolling something out --=C2=A0</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div cla=
ss=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122WordSection1"=
><p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoLis=
tParagraph" style=3D"margin-left:18pt;text-indent:0cm"><span lang=3D"EN-US"=
 style=3D"font-size:12pt;font-family:Calibri,sans-serif;color:black"><u></u=
><u></u></span></p>
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt">
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
4,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"gmail-m_-609=
1798217660211465gmail-m_-7106965077525685122WordSection1"><p class=3D"gmail=
-m_-6091798217660211465gmail-m_-7106965077525685122MsoListParagraph" style=
=3D"margin-left:18pt"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fam=
ily:Calibri,sans-serif;color:black"><u></u><u></u></span></p>
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt">
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
ding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"gmail-m_-60917982176602114=
65gmail-m_-7106965077525685122WordSection1"><p class=3D"gmail-m_-6091798217=
660211465gmail-m_-7106965077525685122MsoListParagraph" style=3D"margin-left=
:18pt"><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif;color:black"> <u></u><u></u></span></p>
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt;text-indent:0cm"><span lang=3D"EN-US" =
style=3D"font-size:12pt;font-family:Calibri,sans-serif;color:black">Based o=
n different OS
</span><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif">environment as below,
<span style=3D"color:black">I would like to have a static executable since =
</span></span><em><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:=
Calibri,sans-serif;color:black;background:white;font-style:normal">dynamica=
lly linked binary can=E2=80=99t work normally
 in host OS.</span></em><span lang=3D"EN-US" style=3D"font-size:12pt;font-f=
amily:Calibri,sans-serif;color:black"><u></u><u></u></span></p>
<table class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122Mso=
TableGrid" border=3D"1" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin=
-left:18pt;border-collapse:collapse;border:none">
<tbody>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border:1pt solid w=
indowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"text-indent:0cm"><span lang=3D"EN-US" style=3D"font-siz=
e:12pt;font-family:Calibri,sans-serif">Host OS environment<u></u><u></u></s=
pan></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"text-indent:0cm"><span lang=3D"EN-US" style=3D"font-siz=
e:12pt;font-family:Calibri,sans-serif">Build environment (OpenBmc)<u></u><u=
></u></span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"text-indent:0cm"><span lang=3D"EN-US" style=3D"font-siz=
e:12pt;font-family:Calibri,sans-serif">Gcc=C2=A0 v4.8.5<u></u><u></u></span=
></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"text-indent:0cm"><span lang=3D"EN-US" style=3D"font-siz=
e:12pt;font-family:Calibri,sans-serif">Gcc=C2=A0=C2=A0 v8.3.0<u></u><u></u>=
</span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"text-indent:0cm"><span lang=3D"EN-US" style=3D"font-siz=
e:12pt;font-family:Calibri,sans-serif">Glibc=C2=A0 v2.17<u></u><u></u></spa=
n></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"text-indent:0cm"><span lang=3D"EN-US" style=3D"font-siz=
e:12pt;font-family:Calibri,sans-serif">Glibc=C2=A0 v2.29<u></u><u></u></spa=
n></p>
</td>
</tr>
</tbody>
</table></div></div></blockquote><div><br></div><div>The bitbake recipe isn=
&#39;t meant to be used for the host tool.=C2=A0 It explicitly disables bui=
lding the host-tool by default.=C2=A0 You should be able to check out the r=
epo and build from there.=C2=A0 Let me know if you run into issues with tha=
t.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div lang=3D"ZH-CN"><div class=3D"gmail-m_-6091798217660211465gmail-m_-=
7106965077525685122WordSection1">
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,san=
s-serif"><span>4.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-size:12pt;fo=
nt-family:Calibri,sans-serif">I didn=E2=80=99t find the below service files=
 in source tree, where can find default services or should we provide our o=
wn services?
<u></u><u></u></span></p>
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt;text-indent:0cm"><code><span lang=3D"E=
N-US" style=3D"font-size:12pt;font-family:Calibri,sans-serif">update_bmc.se=
rvice</span></code><span lang=3D"EN-US" style=3D"font-size:12pt;font-family=
:Calibri,sans-serif"><br>
<code><span style=3D"font-family:Calibri,sans-serif">verify_image.service</=
span></code></span><span lang=3D"EN-US" style=3D"font-size:12pt;font-family=
:Calibri,sans-serif"><u></u><u></u></span></p>
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt;text-indent:0cm"><code><span lang=3D"E=
N-US" style=3D"font-size:12pt;font-family:Calibri,sans-serif">prepare_updat=
e.service</span></code></p></div></div></blockquote><div><br></div><div>Tha=
t&#39;s correct.=C2=A0 There are currently no default service files.=C2=A0 =
I am thinking of providing a default prepare_update service in a later CL, =
however updating the BMC or verifying the image depend entirely on the syst=
em -- which makes it difficult to have a default.=C2=A0 In point of fact, t=
here isn&#39;t really a valid default phosphor-ipmi-flash build for a BMC.=
=C2=A0 Everything needs to be specified.</div><div><br></div><div>^--- I ca=
n work on making the ubi bmc option available if the ubi distro feature is =
enabled, etc -- providing some defaults.</div><div>^--- I have a plan to pr=
ovide a prepare_update.service once I finish testing Aspeed LPC support.</d=
iv><div>=C2=A0</div></div></div></blockquote><div><br></div><div>I&#39;ve b=
een reviewing the build process for the host-tool and the configure file an=
d other pieces require the BMC-stuff to be installed first (sdbusplus, etc)=
.=C2=A0 I&#39;m going to cleanup the configure file so that if you&#39;re b=
uilding the host-tool it doesn&#39;t try to build the BMC stuff.=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
lang=3D"ZH-CN"><div class=3D"gmail-m_-6091798217660211465gmail-m_-710696507=
7525685122WordSection1"><p class=3D"gmail-m_-6091798217660211465gmail-m_-71=
06965077525685122MsoListParagraph" style=3D"margin-left:18pt;text-indent:0c=
m"><code><span lang=3D"EN-US" style=3D"font-size:12pt;font-family:Calibri,s=
ans-serif"><u></u><u></u></span></code></p>
<p class=3D"gmail-m_-6091798217660211465gmail-m_-7106965077525685122MsoList=
Paragraph" style=3D"margin-left:18pt;text-indent:0cm"><span lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:Calibri,sans-serif">Regards,<br>
Andrew<u></u><u></u></span></p>
</div>
</div>

</blockquote></div></div>
</blockquote></div></div>

--0000000000003d464e058c4481d5--
