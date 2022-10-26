Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80860DE03
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 11:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4My3NR2qQlz3c8V
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 20:26:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B1djeVX+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B1djeVX+;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4My3Ms21Xrz2x9P
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 20:26:14 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id s196so14238889pgs.3
        for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k6JLSfji7Epo+0vq9Dbmj6OHFCkNv5O/RiTPmHyTPV4=;
        b=B1djeVX+7Di92He+dwkfiPEbObfUrzQMTFbhxzBqXmHhN4dB4on7Zfdr2bYzERDnAz
         +QYVeEAicLINxRNgzD6LWnXbXnPn5cyg+77Tp6dQfFwYg3FmbwSxe+65lsp6YMwh8JgX
         QkCQdXb+tgY5hniYwoHSIeZ+7KPKm2jRANqzuFoX4btV2dwvAlZeSofZ9i2Hfs2hGxpb
         CtPyZikPF0SpcB3TzhM+ZMvFCKhn+cLf2+NUiFMfPBZzpvCoAKBS9RXGCl3aLV72xGTA
         jyQuObaoTW2pZZUgZpYXNaJqTo7HKGsfm7AnMdFDACeVqNz8yswuDRf8+Yjz8l4KBYm2
         umYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6JLSfji7Epo+0vq9Dbmj6OHFCkNv5O/RiTPmHyTPV4=;
        b=2SnIjTsFTdGupkzx8R4yS4e458lpTZKxZr2vJ0ZzNy13M8xxo1NXslTGfsTbO/4POI
         F6AmXt6fEPiLfFdSgQHDs9sXa+upy1G4XIl0hThUCOzjY6FZDLYqWCotfmAIq1DFNuFw
         5F4+94U/gk4I8K+AfPch+N6gEiD8x9+7JVsFHhoeWiIWVlEyqeWyU9F4MkN55C4xJspw
         O3PZ86/H6e3s2e3TVgOK7F0zCd7hPm5C+GkfJF33ZMJm/A5yTBrcyhhGAVm9rzv7vXvo
         I/oQeo+bFdcx/bcB3zCtqpY7mtRsvO7xbOWLMxyPi2dfk+3HvoRmehoBDA0ORBnTkOrq
         bsvg==
X-Gm-Message-State: ACrzQf3rkjWK4da1K+xf7eeriZ/NdUiQ038pZkMiFgRdkjbFs86ncxni
	dZ8VIyLmnEncoJGSq6AUWyZyw42W6EFqVNDW3SY=
X-Google-Smtp-Source: AMsMyM6ldFDUUNs++ucxObSnnfXNJ92/1JQbXXceBnQ5zYGGC4c3PDVP5lrHOHNzoK8rMwslNWd4kLLtagdwiAwCljI=
X-Received: by 2002:a63:5a50:0:b0:429:8580:fc61 with SMTP id
 k16-20020a635a50000000b004298580fc61mr37716233pgm.215.1666776370829; Wed, 26
 Oct 2022 02:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR1501MB2030A4F780F2226BC4C5CDB9FA2D9@SN6PR1501MB2030.namprd15.prod.outlook.com>
In-Reply-To: <SN6PR1501MB2030A4F780F2226BC4C5CDB9FA2D9@SN6PR1501MB2030.namprd15.prod.outlook.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Wed, 26 Oct 2022 14:55:59 +0530
Message-ID: <CACkAXSqF5d2k4aPMcpGW+++oomyucHpV9SgGtiUUWu1DRaRwMQ@mail.gmail.com>
Subject: Re: changes to phosphor-debug-collector plugins
To: Devender Rao <devenrao@in.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000080dda505ebec9dbe"
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

--00000000000080dda505ebec9dbe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 5:34 PM Devender Rao <devenrao@in.ibm.com> wrote:

> Hi All,
>
> I am planning to deprecate/remove some of the dump plugins as some of the
> commands are no longer valid or have been captured as part of other plugi=
ns.
>
> Remove altfwprintenv
> <https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dr=
eport.d/plugins.d/altfwprintenv>
>  plugin
> This plugin caters to capturing "Alt-Flash: U-Boot environment variables"
> and it is applicable to systems that have 2 BMC chips.
>
> https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dre=
port.d/plugins.d/altfwprintenv
> pushed the following commit
> https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/52943/21
>
Prefers @adriana's alternative approach in the review instead of removing
this
"I'm ok with it being removed, an alternative would be to leave it but do
not print the error message if the file doesn't exist. The only system that
currently supports the alternate environment is witherspoon, don't think
this has being used for debug for the CI machines."

>
>
> Consolidating network-related plugins, moving the ipaddr, iplink plugins
> to network plugin
> Removing
> https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dre=
port.d/plugins.d/ipaddr
> Removing
> https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dre=
port.d/plugins.d/iplink
> adding functionality from above plugins onto network plugin
> https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/52891/22
>
> The design direction we used for plugin is to keep functionality specific
to plugins to support user to attach only required plugins to dump types or
systems. Consolidating multiple functionalities into single plugin is going
to break this fundamental design point, unless there is strong reason for
removing these mini type plugins from the dump.


> Remove
> https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dre=
port.d/plugins.d/servicestatus plugin
> as it
> is a time-consuming operation and as we already have
> https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dre=
port.d/plugins.d/failedservices plugin
> which
> collects failed services details.
> https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/53082/13
>
> I have already  requeted  to change your initial  commit =E2=80=9C
https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/52468=E2=80=
=9D to
print masked services , instead of general status.  Looks like  Andrew
requested to add this support , please use git revert feature to remove
your initial commit instead of pushing new commit to delete the file.
Please refer
https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/52468/comme=
nt/570e2916_90fcaa89/
for more details.


If anyone has dependencies in automation scripts or has a need for them or
> has any concerns, please respond.
>
> Regards
> Devender
>
>
> <https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dr=
eport.d/plugins.d/failedservices>
> phosphor-debug-collector/failedservices at master =C2=B7
> openbmc/phosphor-debug-collector
> <https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dr=
eport.d/plugins.d/failedservices>
> Collects debug data from the BMC for extraction. Contribute to
> openbmc/phosphor-debug-collector development by creating an account on
> GitHub.
> github.com
>
>
> <https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dr=
eport.d/plugins.d/servicestatus>
> phosphor-debug-collector/servicestatus at master =C2=B7
> openbmc/phosphor-debug-collector
> <https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dr=
eport.d/plugins.d/servicestatus>
> Collects debug data from the BMC for extraction. Contribute to
> openbmc/phosphor-debug-collector development by creating an account on
> GitHub.
> github.com
>
>
>
>

--00000000000080dda505ebec9dbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 21, 2022 at 5:34 PM Deven=
der Rao &lt;<a href=3D"mailto:devenrao@in.ibm.com">devenrao@in.ibm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
class=3D"msg-6554113464284509247">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi All,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I am planning to deprecate/remove some of the dump plugins as some of the c=
ommands are no longer valid or have been captured as part of other plugins.=
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Remove=C2=A0<a href=3D"https://github.com/openbmc/phosphor-debug-collector/=
blob/master/tools/dreport.d/plugins.d/altfwprintenv" style=3D"margin:0px;ba=
ckground-color:rgb(255,255,255)" target=3D"_blank">altfwprintenv</a>=C2=A0p=
lugin</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:ui-monospace,SFMono-Regular,&qu=
ot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-=
size:12px;background-color:rgb(255,255,255);display:inline">This plugin cat=
ers
 to capturing &quot;Alt-Flash: U-Boot environment variables&quot; and it is=
 applicable to systems that have 2 BMC chips.</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<a href=3D"https://github.com/openbmc/phosphor-debug-collector/blob/master/=
tools/dreport.d/plugins.d/altfwprintenv" id=3D"m_-1317989977178176109LPNoLP=
OWALinkPreview" target=3D"_blank">https://github.com/openbmc/phosphor-debug=
-collector/blob/master/tools/dreport.d/plugins.d/altfwprintenv</a><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<div></div>
pushed the following commit<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/=
52943/21" id=3D"m_-1317989977178176109LPlnk118436" target=3D"_blank">https:=
//gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/52943/21</a></div=
></div></div></blockquote><div>Prefers=C2=A0@adriana&#39;s alternative appr=
oach in the review instead of removing this <br></div><div>&quot;<span id=
=3D"gmail-output">I&#39;m ok with it being removed, an alternative would be=
 to leave it but do not print the error message if the file doesn&#39;t exi=
st.
The only system that currently supports the alternate environment is wither=
spoon, don&#39;t think this has being used for debug for the CI machines.&q=
uot;</span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div cla=
ss=3D"msg-6554113464284509247"><div dir=3D"ltr"><div style=3D"font-family:C=
alibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br>
<br>
Consolidating network-related plugins, moving the ipaddr, iplink plugins to=
 network plugin</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Removing=C2=A0<a href=3D"https://github.com/openbmc/phosphor-debug-collecto=
r/blob/master/tools/dreport.d/plugins.d/ipaddr" id=3D"m_-131798997717817610=
9LPNoLPOWALinkPreview_1" target=3D"_blank">https://github.com/openbmc/phosp=
hor-debug-collector/blob/master/tools/dreport.d/plugins.d/ipaddr</a><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Removing=C2=A0<a href=3D"https://github.com/openbmc/phosphor-debug-collecto=
r/blob/master/tools/dreport.d/plugins.d/iplink" id=3D"m_-131798997717817610=
9LPNoLPOWALinkPreview_2" target=3D"_blank">https://github.com/openbmc/phosp=
hor-debug-collector/blob/master/tools/dreport.d/plugins.d/iplink</a><br>
adding functionality from above plugins onto network plugin<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/=
52891/22" id=3D"m_-1317989977178176109LPlnk674315" target=3D"_blank">https:=
//gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/52891/22</a><br>
<br></div></div></div></blockquote><div>The design direction we used for pl=
ugin is to keep functionality specific to plugins to support user to attach=
 only required plugins to dump types or systems. Consolidating multiple fun=
ctionalities into single plugin is going to break this fundamental design p=
oint, unless there is strong reason for removing these mini type plugins fr=
om the dump.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div class=3D"msg-6554113464284509247"><div dir=3D"ltr"><div =
style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<div></div>
Remove=C2=A0<a href=3D"https://github.com/openbmc/phosphor-debug-collector/=
blob/master/tools/dreport.d/plugins.d/servicestatus" id=3D"m_-1317989977178=
176109LPlnkOWALinkPreview_3" target=3D"_blank">https://github.com/openbmc/p=
hosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/servicestatus=
</a>=C2=A0plugin
 as it</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
is a time-consuming operation and as we already have=C2=A0<a href=3D"https:=
//github.com/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/p=
lugins.d/failedservices" id=3D"m_-1317989977178176109LPlnkOWALinkPreview_4"=
 target=3D"_blank">https://github.com/openbmc/phosphor-debug-collector/blob=
/master/tools/dreport.d/plugins.d/failedservices</a>=C2=A0plugin
 which</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
collects failed services details.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/=
53082/13" id=3D"m_-1317989977178176109LPlnk897787" target=3D"_blank">https:=
//gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/53082/13</a><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br></div></div></div></blockquote><div>I have already =C2=A0requeted =C2=
=A0to change your initial=C2=A0 commit =E2=80=9C<a href=3D"https://gerrit.o=
penbmc.org/c/openbmc/phosphor-debug-collector/+/52468">https://gerrit.openb=
mc.org/c/openbmc/phosphor-debug-collector/+/52468</a>=E2=80=9D to print mas=
ked services , instead of general status.=C2=A0 Looks like=C2=A0 Andrew req=
uested to add this support , please use git revert feature to remove your i=
nitial commit instead of pushing new commit to delete the file. Please refe=
r <a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/=
+/52468/comment/570e2916_90fcaa89/">https://gerrit.openbmc.org/c/openbmc/ph=
osphor-debug-collector/+/52468/comment/570e2916_90fcaa89/</a> for more deta=
ils.</div><div><br></div><div> <br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div class=3D"msg-6554113464284509247"><div dir=3D"ltr"><di=
v style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;co=
lor:rgb(0,0,0)">
If anyone has dependencies in automation scripts or has a need for them or =
has any concerns, please respond.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
Regards</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Devender<br>
<br>
<div>
<div id=3D"m_-1317989977178176109LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL29wZW5=
ibWMvcGhvc3Bob3ItZGVidWctY29sbGVjdG9yL2Jsb2IvbWFzdGVyL3Rvb2xzL2RyZXBvcnQuZC=
9wbHVnaW5zLmQvZmFpbGVkc2VydmljZXM." style=3D"width:100%;margin-top:16px;mar=
gin-bottom:16px;max-width:800px;min-width:424px">
<table id=3D"m_-1317989977178176109LPContainer143613" role=3D"presentation"=
 style=3D"padding:12px 36px 12px 12px;width:100%;border-width:1px;border-st=
yle:solid;border-color:rgb(200,200,200);border-radius:2px">
<tbody>
<tr style=3D"border-spacing:0px" valign=3D"top">
<td>
<div id=3D"m_-1317989977178176109LPImageContainer143613" style=3D"margin-ri=
ght:12px;height:120px;overflow:hidden;width:240px">
<a id=3D"m_-1317989977178176109LPImageAnchor143613" href=3D"https://github.=
com/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/=
failedservices" target=3D"_blank"><img id=3D"m_-1317989977178176109LPThumbn=
ailImageId143613" alt=3D"" style=3D"display: block;" src=3D"https://opengra=
ph.githubassets.com/ce6c79c9f23b83b25bc9ee5d88dcaf23230855ba9a59b2ba1ccb8b6=
4bc5c65ea/openbmc/phosphor-debug-collector" width=3D"240" height=3D"120"></=
a></div>
</td>
<td style=3D"width:100%">
<div id=3D"m_-1317989977178176109LPTitle143613" style=3D"font-size:21px;fon=
t-weight:300;margin-right:8px;font-family:wf_segoe-ui_light,&quot;Segoe UI =
Light&quot;,&quot;Segoe WP Light&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&=
quot;,Tahoma,Arial,sans-serif;margin-bottom:12px">
<a id=3D"m_-1317989977178176109LPUrlAnchor143613" href=3D"https://github.co=
m/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/fa=
iledservices" style=3D"text-decoration:none" target=3D"_blank">phosphor-deb=
ug-collector/failedservices at master
 =C2=B7 openbmc/phosphor-debug-collector</a></div>
<div id=3D"m_-1317989977178176109LPDescription143613" style=3D"font-size:14=
px;max-height:100px;color:rgb(102,102,102);font-family:wf_segoe-ui_normal,&=
quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;margin-bot=
tom:12px;margin-right:8px;overflow:hidden">
Collects debug data from the BMC for extraction. Contribute to openbmc/phos=
phor-debug-collector development by creating an account on GitHub.</div>
<div id=3D"m_-1317989977178176109LPMetadata143613" style=3D"font-size:14px;=
font-weight:400;color:rgb(166,166,166);font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"http://github.com" target=3D"_blank">github.com</a></div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
<div>
<div id=3D"m_-1317989977178176109LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL29wZW5=
ibWMvcGhvc3Bob3ItZGVidWctY29sbGVjdG9yL2Jsb2IvbWFzdGVyL3Rvb2xzL2RyZXBvcnQuZC=
9wbHVnaW5zLmQvc2VydmljZXN0YXR1cw.." style=3D"width:100%;margin-top:16px;mar=
gin-bottom:16px;max-width:800px;min-width:424px">
<table id=3D"m_-1317989977178176109LPContainer920616" role=3D"presentation"=
 style=3D"padding:12px 36px 12px 12px;width:100%;border-width:1px;border-st=
yle:solid;border-color:rgb(200,200,200);border-radius:2px">
<tbody>
<tr style=3D"border-spacing:0px" valign=3D"top">
<td>
<div id=3D"m_-1317989977178176109LPImageContainer920616" style=3D"margin-ri=
ght:12px;height:120px;overflow:hidden;width:240px">
<a id=3D"m_-1317989977178176109LPImageAnchor920616" href=3D"https://github.=
com/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/=
servicestatus" target=3D"_blank"><img id=3D"m_-1317989977178176109LPThumbna=
ilImageId920616" alt=3D"" style=3D"display: block;" src=3D"https://opengrap=
h.githubassets.com/ce6c79c9f23b83b25bc9ee5d88dcaf23230855ba9a59b2ba1ccb8b64=
bc5c65ea/openbmc/phosphor-debug-collector" width=3D"240" height=3D"120"></a=
></div>
</td>
<td style=3D"width:100%">
<div id=3D"m_-1317989977178176109LPTitle920616" style=3D"font-size:21px;fon=
t-weight:300;margin-right:8px;font-family:wf_segoe-ui_light,&quot;Segoe UI =
Light&quot;,&quot;Segoe WP Light&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&=
quot;,Tahoma,Arial,sans-serif;margin-bottom:12px">
<a id=3D"m_-1317989977178176109LPUrlAnchor920616" href=3D"https://github.co=
m/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/se=
rvicestatus" style=3D"text-decoration:none" target=3D"_blank">phosphor-debu=
g-collector/servicestatus at master
 =C2=B7 openbmc/phosphor-debug-collector</a></div>
<div id=3D"m_-1317989977178176109LPDescription920616" style=3D"font-size:14=
px;max-height:100px;color:rgb(102,102,102);font-family:wf_segoe-ui_normal,&=
quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;margin-bot=
tom:12px;margin-right:8px;overflow:hidden">
Collects debug data from the BMC for extraction. Contribute to openbmc/phos=
phor-debug-collector development by creating an account on GitHub.</div>
<div id=3D"m_-1317989977178176109LPMetadata920616" style=3D"font-size:14px;=
font-weight:400;color:rgb(166,166,166);font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"http://github.com" target=3D"_blank">github.com</a></div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
<br>
</div>
<div></div>
<br>
</div>

</div></blockquote></div></div>

--00000000000080dda505ebec9dbe--
