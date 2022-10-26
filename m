Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6293560D8CD
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 03:20:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxrZl1MKLz3bls
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 12:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QFfIqZIW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=cweinan@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QFfIqZIW;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxrZ72tZHz3bhg
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 12:19:26 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id r14so39130201edc.7
        for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 18:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UwRAwefQKB+bo7xnnov2v4Ge/v6MsyF2rLBfvpPel34=;
        b=QFfIqZIWW4+j85zfCyZLN542aI1Pi3iPF8yHdZD61A7qD8eCuerAfNO6sRA4ciUacd
         VRIe5ActDAqVH2DgA0TgK5vFt1dcD+Ln5PtmC+zWhe1jHpFFuBDYxPca1r0EDxlzEt45
         pjL9RVy3NRqm/VX5vFUDXNBxYS1+IEfvC4OivkmlKRMwFpsDwp78ckdIGyl5Owwzj/w3
         ZIpNJe3P3VoxjZIh28Lkah1Vc7EvWWqpJYPmOy76g2NoxmvPCi29fbVaP8rTtoy2iDZN
         EI34cvGykHwCoZRs6HVfmwHnhoHic1/I5i512slsQUfWctEcng135IThbtOVnYnUbhEu
         AqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwRAwefQKB+bo7xnnov2v4Ge/v6MsyF2rLBfvpPel34=;
        b=a8C046BC9wNfUo5XCmr4CM03dw6bXLbppJZOghiR8fEmqW1pRk70pXpBaxKtJ5Ut1P
         IvwvtgBU0HDIJXkyh4tQKLWZOkkSfV5ArowQqbGIORPVGaxIcSTiBE76jo8huS0dw+pg
         4YQJI+XqZeYqDzIAkKwYULsx5SiX5GV7l5PbebmF7t2FxIua9UbB4o0AuVCxwQO5barX
         NbJMyoENmR1pCqN1ImngzecLkVhQ0n3r0VtP4GklJ5opMXPiD9TxOtKdqkqFG3eSO4AL
         AW3FWn+uyj2CfniuHndl89V5F8Ztxt9BZUVKbpriNEwxVerJrgdt2yH37HqBKBR6FuTB
         WwYg==
X-Gm-Message-State: ACrzQf3PFqq2QAyioQR5mMtmRomTXLN5JA3nJRNmB4ZnLSyEHwbND7kQ
	goB95EuSMcwGwyqj2KzQcZVJu4XKtcefJApFlqPzLcWYV8+F/g==
X-Google-Smtp-Source: AMsMyM5hqdtWJXhekNE7AOuTWjJo3JVu/vCwsCOXc7AEmR/PpXXhK7+dnTDm/gCAM5yxpeR4VgXnNrJJL7+Et15WzV0=
X-Received: by 2002:a05:6402:5162:b0:457:6ef2:df3 with SMTP id
 d2-20020a056402516200b004576ef20df3mr38134192ede.128.1666747156756; Tue, 25
 Oct 2022 18:19:16 -0700 (PDT)
MIME-Version: 1.0
From: Claire Weinan <cweinan@google.com>
Date: Tue, 25 Oct 2022 18:19:05 -0700
Message-ID: <CAC4LpBw+H2v5tHT8gAThLrmx8X-Oe6xVLhQ+STBXm0LXgGgv2Q@mail.gmail.com>
Subject: Proposed bmcweb dump LogService "Name" change
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000362afe05ebe5d0a0"
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

--000000000000362afe05ebe5d0a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I have opened a bmcweb code review (
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/57949) proposing a change to
the "Name" property of dump LogServices. This is best shown with examples:

Example from /redfish/v1/Managers/bmc/LogServices/FaultLog:
Before: "Name": "Dump LogService"
After: "Name": "*FaultLog* Dump LogService"

Example from /redfish/v1/Managers/bmc/LogServices/Dump:
Before: "Name": "Dump LogService"
After: "Name": "*BMC* Dump LogService"

Example from /redfish/v1/Systems/system/LogServices/Dump:
Before: "Name": "Dump LogService"
After: "Name": "*System* Dump LogService"

*Are any Redfish clients currently matching on this "Name" value? If so,
would it be feasible to change from checking if "Name" equals "Dump
LogService" to checking if "Name" contains "Dump LogService"?  *

---
Details on the reasoning for changing to a more specific name:

This allows a client to differentiate the dump types of various dump
LogServices based on the "Name" property. (For example, the client might
only be interested in examining LogServices of one particular dump type.)

From Redfish spec v1.16.0, section 9.6.7 "Name": "The Name property conveys
a human-readable moniker for a resource. The data type of the Name property
shall be string. The value of Name is NOT required to be unique across
resource instances within a resource collection."

Based on the above, the primary purpose of "Name" is to be a
"human-readable moniker=E2=80=9D. I did not find a statement in the Redfish=
 spec on
whether it can be used for type matching. One type-related property in the
LogService schema is "LogEntryType" -- however the possible values (Event,
Multiple, OEM, SEL) aren't fine-grained enough to determine the exact dump
type for this use case.

So in the absence of another suitable LogService property for a client to
use to differentiate between dump types (and various OEM LogService types
in general), we opt to use the "Name" property.

Best Regards,
Claire Weinan
--=20

[image: Google Logo]
Claire Weinan
Software Engineer
cweinan@google.com

--000000000000362afe05ebe5d0a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I have opened a bmcw=
eb code review (<a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/57=
949">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/57949</a>) proposing a c=
hange to the &quot;Name&quot; property of dump LogServices. This is best sh=
own with examples:</div><div><br></div><div><div>Example from /redfish/v1/M=
anagers/bmc/LogServices/FaultLog:</div><div>Before: &quot;Name&quot;: &quot=
;Dump LogService&quot;=C2=A0</div><div>After: &quot;Name&quot;: &quot;<b>Fa=
ultLog</b> Dump LogService&quot;=C2=A0</div><div><br></div><div>Example fro=
m /redfish/v1/Managers/bmc/LogServices/Dump:</div><div>Before: &quot;Name&q=
uot;: &quot;Dump LogService&quot;=C2=A0</div><div>After: &quot;Name&quot;: =
&quot;<b>BMC</b> Dump LogService&quot;=C2=A0</div><div><br></div><div>Examp=
le from /redfish/v1/Systems/system/LogServices/Dump:</div><div>Before: &quo=
t;Name&quot;: &quot;Dump LogService&quot;=C2=A0</div><div>After: &quot;Name=
&quot;: &quot;<b>System</b> Dump LogService&quot;</div></div><div><br></div=
><div><b>Are any Redfish clients currently matching=C2=A0on this &quot;Name=
&quot; value? If so, would it be=C2=A0feasible to change from checking if &=
quot;Name&quot; <i>equals</i> &quot;Dump LogService&quot; to checking if &q=
uot;Name&quot; <i>contains=C2=A0</i>&quot;Dump LogService&quot;?<i>=C2=A0</=
i>=C2=A0</b></div><div><br></div><div>---</div><div>Details on the reasonin=
g for changing to a more specific name:</div><div><br></div>This allows a c=
lient to differentiate the dump types of various dump LogServices based on =
the &quot;Name&quot; property. (For example, the client might only be inter=
ested in examining LogServices of one particular dump type.)<div><br></div>=
<div>From Redfish spec v1.16.0, section 9.6.7 &quot;Name&quot;: &quot;The N=
ame property conveys a human-readable moniker for a resource. The data type=
 of the Name property shall be string. The value of Name is NOT required to=
 be unique across resource instances within a resource collection.&quot;=C2=
=A0</div><div><br></div><div>Based on the above, the primary purpose of &qu=
ot;Name&quot; is to be a &quot;human-readable moniker=E2=80=9D. I did not f=
ind a statement in the Redfish spec on whether it can be used for type matc=
hing. One type-related property in the LogService schema is &quot;LogEntryT=
ype&quot; -- however the possible values (Event, Multiple, OEM, SEL) aren&#=
39;t fine-grained enough to determine the exact dump type for this use case=
.</div><div><br></div><div>So in the absence of another suitable LogService=
 property for a client to use to differentiate between dump types (and vari=
ous OEM LogService types in general), we opt to use the &quot;Name&quot; pr=
operty.=C2=A0<div><br></div><div><div>Best Regards,</div><div>Claire Weinan=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><table width=3D"90%" border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0" style=3D"margin:0px;padding:0px;font-family:Tim=
es;max-width:348px"><tbody style=3D"margin:0px;padding:0px"><tr style=3D"ma=
rgin:0px;padding:0px"><td style=3D"padding:0px"><br><table border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D"margin:0px;padding:20px 0px 0px">=
<tbody style=3D"margin:0px;padding:0px"><tr style=3D"margin:0px;padding:0px=
"><td valign=3D"top" style=3D"padding:0px 20px 0px 0px;vertical-align:top;b=
order-right:1px solid rgb(213,213,213)"><img src=3D"https://www.gstatic.com=
/images/branding/product/1x/googleg_64dp.png" alt=3D"Google Logo" width=3D"=
72" style=3D"margin:0px;padding:0px;display:block;height:auto"></td><td sty=
le=3D"padding:0px 0px 0px 20px"><table border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0" style=3D"margin:0px;padding:0px"><tbody style=3D"margin:0px;pa=
dding:0px"><tr style=3D"margin:0px;padding:0px"><td colspan=3D"2" style=3D"=
padding:1px 0px 5px;font-family:Arial,Helvetica,Verdana,sans-serif;font-siz=
e:13px;line-height:13px;color:rgb(56,58,53);font-weight:700">Claire Weinan<=
/td></tr><tr style=3D"margin:0px;padding:0px"><td colspan=3D"2" style=3D"pa=
dding:0px 0px 5px;font-family:Arial,Helvetica,Verdana,sans-serif;font-size:=
11px;line-height:13px;color:rgb(56,58,53)">Software Engineer</td></tr><tr s=
tyle=3D"margin:0px;padding:0px"><td colspan=3D"2" style=3D"padding:0px 0px =
5px;font-family:Arial,Helvetica,Verdana,sans-serif;font-size:11px;line-heig=
ht:13px;color:rgb(56,58,53)"><a href=3D"mailto:cweinan@google.com" target=
=3D"_blank">cweinan@google.com</a></td></tr><tr style=3D"margin:0px;padding=
:0px"><td colspan=3D"2" style=3D"padding:0px 0px 3px;font-family:Arial,Helv=
etica,Verdana,sans-serif;font-size:11px;line-height:13px;color:rgb(3,112,24=
8)"></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody><=
/table></div></div></div></div></div>

--000000000000362afe05ebe5d0a0--
