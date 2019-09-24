Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 157F2BC7C2
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 14:18:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d0b64XvqzDqNK
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 22:18:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=rahulmaheshwari01@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jezc31Ej"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d0ZM70HxzDq5W
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 22:17:47 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id q1so3877523ion.1
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PqrSgdL6kpwL3+ziJ1VYGbf/4j2Uf1WfvIAxdhrd7w=;
 b=Jezc31Ejesa+gplZ70IePT1pUKfe/RmdU1D2rXgkx+7jwUaaCK+hTxXm2V7cMZWBfz
 JxBRBjLHS+Hv3pbYd66omIUf2k80WgsllEMeojSPNWENHr5gelfjWKtjajrw49k4UQER
 2t+9FY7dCpkHRGCkwpZ4+LT1kg1hYxud6OtLNE2V6VVkmZGwoDVDDUc9f7KY1y0P+gtT
 OnidulkrSOWROn+2QgetPE2Ys5kbViBVQocPnO54MLQ95fTZOAXEX2spm6CF86PR4Eci
 P7hiQhdGB5911gEC8LIkfYB1OCiZmwyi6ogTQOTkr/hyNmlEsQNeESLW8r+isOnqdxGG
 7uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PqrSgdL6kpwL3+ziJ1VYGbf/4j2Uf1WfvIAxdhrd7w=;
 b=HvOK4dBaMxLerK75qUpvc/O4dMH92otYrqMmm4UrIRMJ94C1gQgd6RnX1NKxz8usM0
 p3qWvhTgnbpGYGXi/3/yaPldLhgty7uTXOcQe99YMhFGgp+EmKJp2KR3yvXLp72hr6Gh
 riJs+siwMk8KJ6DnPKcDu5gZ2XE4Y83uSJIl+CmI25WxKlDCWn1Aw6DX4iw1e8TJRmVL
 AYXP7+zgbuaPjQnaVTLXJYYWWc/BP9hTOsZVLE+VnOyXtGk3EHq4dQuX9lxlK2hVLlWj
 9g/phgB6/N2mxllRFLB5HMD6T2QVdendRsus56XqS1z9j9ARNVNqVdewAtaIZ9KPS5SF
 YFWQ==
X-Gm-Message-State: APjAAAVjs/WeHNal5eiQKyj59T5E5gf+ckuR1n5QmrEz3DrJ1KCgdGw9
 vUelM0SVUVtwa9sJ390mLojhx80t0YrGgr5G4/kOICS9
X-Google-Smtp-Source: APXvYqyuHNVU1MiwQpHRxMWmENq8YCY7hhLqGOb0A4cbHqYRx84u7ugVdpycL2aGIoWBVOLiKzwbVaFH8nvOsIevBVI=
X-Received: by 2002:a5e:c00a:: with SMTP id u10mr3173876iol.73.1569327464841; 
 Tue, 24 Sep 2019 05:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <a1b7c13a259b4e259796bbcf07834ae7@quantatw.com>
 <CAAMkS12M-LP=v4gNdxgRShKUF7QZKTVFSa=Vg=qebzq7AXm3rg@mail.gmail.com>
 <287d14323764462898a05d4a1ea070ed@quantatw.com>
In-Reply-To: <287d14323764462898a05d4a1ea070ed@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Tue, 24 Sep 2019 17:47:33 +0530
Message-ID: <CAAMkS13YQ8Z=cYcd5pYMivbuGJVZRzmE19CO72dAvG-M6_bA-g@mail.gmail.com>
Subject: Re: Questions of openbmc-test-automation
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
Content-Type: multipart/alternative; boundary="00000000000014045605934b86c8"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000014045605934b86c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure. Please go ahead.

Thanks & Regards
Rahul

On Tue, 24 Sep 2019, 07:05 Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89), <Will.=
Liang@quantatw.com>
wrote:

> Hi  Rahul,
>
>
> Thank you for your responds.
>
> According to our request, can I add a new IPMI test suite and a new IPMI
> only keyword?
>
>
> BRs,
> Will
> ------------------------------
> *=E5=AF=84=E4=BB=B6=E8=80=85:* Rahul Maheshwari <rahulmaheshwari01@gmail.=
com>
> *=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F:* 2019=E5=B9=B49=E6=9C=8823=E6=97=
=A5 =E4=B8=8B=E5=8D=88 07:29
> *=E6=94=B6=E4=BB=B6=E8=80=85:* Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89)
> *=E5=89=AF=E6=9C=AC:* openbmc@lists.ozlabs.org
> *=E4=B8=BB=E6=97=A8:* Re: Questions of openbmc-test-automation
>
> Hi Will
> At present, we don't have ways to avoid Redfish dependency in IPMI suite.
> We can code like the way you pointed, but it is possible only for some IP=
MI
> commands(like power on and off). For all other IPMI commands like event
> logs, FRU, SDR, DCMI commands we need to depend on Redfish to verify the
> output.
>
> Thanks
> Rahul
>
>
>
> On Mon, 23 Sep 2019, 11:13 Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89), <Wil=
l.Liang@quantatw.com>
> wrote:
>
>> Hi,
>>
>> I use the "openbmc-test-automation" package to test our project.
>> And I just want to implement the IPMI test case because our platform doe=
s
>> not support REDFISH (IPMI only).
>> But I found that in the IPMI test case, it use the REFISH command as wel=
l
>> (eg Redfish power on[0]).
>>
>> [0]
>> https://github.com/openbmc/openbmc-test-automation/blob/2a520ee37c72ea84=
7ca2d6c773493a6dd752c827/ipmi/test_ipmi_sdr.robot#L59
>>
>> My questions are following:
>> 1. Are there other ways to avoid using the Redfish commands?
>> 2. Is it possible to add parameter(ex:PROTOCOL) on the command line to
>> select the protocol to use?
>> For example:
>> - add the new keyword maybe like "Power On".
>> - and the new keyword "power on" can use the new parameter to choose wha=
t
>> protocol be used(default protocol is REDFISH if not set).
>> - the new keyword like below:
>> Power On
>>     [Documentation]  select the execute protocol.
>>     [Arguments]  ${stack_mode}=3D${stack_mode}  ${quiet}=3D${quiet}
>>
>>     Run Keyword If  '${PROTOCOL}' =3D=3D 'Redfish'
>>     ...   Redfish Power On    stack_mode=3Dskip    quiet=3D0
>>     ...   ELSE    IPMI Power On    stack_mode=3Dskip    quiet=3D0
>>
>> BRs
>> Will
>>
>

--00000000000014045605934b86c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sure. Please go=C2=A0ahead.=C2=A0<div dir=3D"auto"><br></=
div><div dir=3D"auto">Thanks &amp; Regards</div><div dir=3D"auto">Rahul</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, 24 Sep 2019, 07:05 Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89), &lt;=
<a href=3D"mailto:Will.Liang@quantatw.com">Will.Liang@quantatw.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">




<div dir=3D"ltr">
<div id=3D"m_1027952004569296680divtagdefaultwrapper" style=3D"font-size:12=
pt;color:#000000;font-family:Calibri,Helvetica,sans-serif" dir=3D"ltr">
<p>Hi=C2=A0 Rahul,</p>
<p><br>
</p>
<p><span style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Seg=
oe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:16px">T=
hank you for your responds.</span></p>
<p><span style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Seg=
oe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:16px"><=
/span></p>
<span>According to our request, can I add a new IPMI test suite and a new I=
PMI only keyword?</span>
<p><br>
</p>
BRs,
<div>Will<br>
<div style=3D"color:rgb(0,0,0)">
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_1027952004569296680divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>=E5=AF=84=
=E4=BB=B6=E8=80=85:</b> Rahul Maheshwari &lt;<a href=3D"mailto:rahulmaheshw=
ari01@gmail.com" target=3D"_blank" rel=3D"noreferrer">rahulmaheshwari01@gma=
il.com</a>&gt;<br>
<b>=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F:</b> 2019=E5=B9=B49=E6=9C=8823=E6=
=97=A5 =E4=B8=8B=E5=8D=88 07:29<br>
<b>=E6=94=B6=E4=BB=B6=E8=80=85:</b> Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89=
)<br>
<b>=E5=89=AF=E6=9C=AC:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" targ=
et=3D"_blank" rel=3D"noreferrer">openbmc@lists.ozlabs.org</a><br>
<b>=E4=B8=BB=E6=97=A8:</b> Re: Questions of openbmc-test-automation</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"auto">
<div>Hi Will</div>
<div dir=3D"auto">At present, we don&#39;t have ways to avoid Redfish depen=
dency in IPMI suite. We can code like the way you pointed, but it is possib=
le only for some IPMI commands(like power on and off). For all other IPMI c=
ommands like event logs, FRU, SDR, DCMI
 commands we need to depend on Redfish to verify the output.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks</div>
<div dir=3D"auto">Rahul</div>
<div dir=3D"auto">
<div dir=3D"auto"><br>
</div>
<br>
<br>
<div class=3D"gmail_quote" dir=3D"auto">
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 23 Sep 2019, 11:13 Will Liang=
 (=E6=A2=81=E6=B0=B8=E9=89=89), &lt;<a href=3D"mailto:Will.Liang@quantatw.c=
om" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">Will.Liang@q=
uantatw.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
<br>
I use the &quot;openbmc-test-automation&quot; package to test our project.<=
br>
And I just want to implement the IPMI test case because our platform does n=
ot support REDFISH (IPMI only).<br>
But I found that in the IPMI test case, it use the REFISH command as well (=
eg Redfish power on[0]).<br>
<br>
[0] <a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/2a52=
0ee37c72ea847ca2d6c773493a6dd752c827/ipmi/test_ipmi_sdr.robot#L59" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">
https://github.com/openbmc/openbmc-test-automation/blob/2a520ee37c72ea847ca=
2d6c773493a6dd752c827/ipmi/test_ipmi_sdr.robot#L59</a><br>
<br>
My questions are following:<br>
1. Are there other ways to avoid using the Redfish commands?<br>
2. Is it possible to add parameter(ex:PROTOCOL) on the command line to sele=
ct the protocol to use?<br>
For example:<br>
- add the new keyword maybe like &quot;Power On&quot;.<br>
- and the new keyword &quot;power on&quot; can use the new parameter to cho=
ose what protocol be used(default protocol is REDFISH if not set).<br>
- the new keyword like below:<br>
Power On<br>
=C2=A0 =C2=A0 [Documentation]=C2=A0 select the execute protocol.<br>
=C2=A0 =C2=A0 [Arguments]=C2=A0 ${stack_mode}=3D${stack_mode}=C2=A0 ${quiet=
}=3D${quiet}<br>
<br>
=C2=A0 =C2=A0 Run Keyword If=C2=A0 &#39;${PROTOCOL}&#39; =3D=3D &#39;Redfis=
h&#39;<br>
=C2=A0 =C2=A0 ...=C2=A0 =C2=A0Redfish Power On=C2=A0 =C2=A0 stack_mode=3Dsk=
ip=C2=A0 =C2=A0 quiet=3D0<br>
=C2=A0 =C2=A0 ...=C2=A0 =C2=A0ELSE=C2=A0 =C2=A0 IPMI Power On=C2=A0 =C2=A0 =
stack_mode=3Dskip=C2=A0 =C2=A0 quiet=3D0<br>
<br>
BRs<br>
Will<br>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--00000000000014045605934b86c8--
