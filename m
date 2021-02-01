Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B5F30AB6A
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 16:33:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTsR70SvrzDq84
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 02:33:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=sharad.openbmc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bEJoo9v2; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTsQ34BZ3zDq7H
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 02:32:22 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id e15so3148036lft.13
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2021 07:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5DcLjZvP5361dOKmHrzaJwsWZnRoKckdTg9RQHLIGGk=;
 b=bEJoo9v2txKIPKaFzCLLh5DTLIJEixxUJo58yx8f84dajxqa4TgGYWGz/THurNJSfE
 o+BwYjoGtrKbziTbBSo48Aq84cxSIeM/yTzIedQVSfAREIE9WDP6WFkK0slECtOhbDt8
 Euypz/aWS2XRLaS7woeZG/SY8Hd4VhigHXcE/NjsxPBDA12ul6h4deie1WJLjb7hcDki
 yCa9e5bJbebVVdHltk+JyGTqJ1kYoM5nidHYaMhs1PU5Y8EMKK+RBh/UnvkNrHZvyEW5
 b0qlJ9veeKwIfn2t/kJ60lSgnz7UTrpJq/wiRAx8MzsULNCvTbFqXFYkbjyqXSY6wXQ9
 RyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5DcLjZvP5361dOKmHrzaJwsWZnRoKckdTg9RQHLIGGk=;
 b=S4wDc4plwHOjuO9oyWWxfV7Sss/z2XdFp7FBt1oB1zrVJRMCSfSuxfoVLPUDoWBpHu
 +UwsAWokeCrjCRv/T54dlZwdseYncPRvkJ9v1XgW5OhYJoD568poW99IsOeFfKwJ3gjH
 6mLS13tHX9vtkmd7ocvo0MjSyw/P/D51GJO2sA1uW/bMPy1qntjcBWYX1YTaBOaJ0wsn
 H27Tw9F2nsV2EyCIfTuRQ2ol6R1t0V4mWsS283o8q/69djw/crQDCOsmXsxfC675+1mt
 +KzURXjaTTrVYnB7p1H0wzpIvzCxV8X0PoFFGJTg/vkoF3v7jiktPPFsFn3BcXUhshRH
 L0/g==
X-Gm-Message-State: AOAM533no6gIU1r93Xkb+M4guJ2rS7JkTaJFlq9ZW8fneCDXIQ/PgB+D
 FJirMEe58Oxy/2r9HqsykuuEp1fiZtqz241i3CoUQWe4+UVMJx4ahhpbog==
X-Google-Smtp-Source: ABdhPJyNhnlp8ib4De/7UH9ypBrWgEJVElWYfiyA1lJfKNGkIMLs0LCm2kyNwIVx3uVOgm/Ot9nQ01WA/cDfQ2HCkVw=
X-Received: by 2002:a05:6512:6f:: with SMTP id
 i15mr9211532lfo.426.1612193535949; 
 Mon, 01 Feb 2021 07:32:15 -0800 (PST)
MIME-Version: 1.0
From: sharad yadav <sharad.openbmc@gmail.com>
Date: Mon, 1 Feb 2021 21:02:04 +0530
Message-ID: <CA+H48BR2EJnGt3Gzo1xD=yct=gxG0RA_Eq9OYroBNw0S7LU__w@mail.gmail.com>
Subject: Error in getting running/functional firmware version.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000004fef005ba480f3e"
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

--00000000000004fef005ba480f3e
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am trying to get the running/functional firmware version from BMC after
uploading an image which errors out.

*Platform:* Upstream tiogapass (QEMU)
*Commit:* Latest master

*Repro Steps:*
1. Upload an image:
    curl -k -H "X-Auth-Token: $token" -H "Content-Type:
application/octet-stream" -X POST -T
obmc-phosphor-image-tiogapass.static.mtd.tar https://
${bmc}/redfish/v1/UpdateService

2. Get the firmware version:
    curl -k -H "X-Auth-Token: $token" -H "Content-Type:
application/octet-stream" -X GET https://${bmc}/redfish/v1/Managers/bmc
*Error:*























*{  "@odata.id <http://odata.id>": "/redfish/v1/Managers/bmc",
"@odata.type": "#Manager.v1_9_0.Manager",  "Actions": {
"#Manager.Reset": {      "@Redfish.ActionInfo":
"/redfish/v1/Managers/bmc/ResetActionInfo",      "target":
"/redfish/v1/Managers/bmc/Actions/Manager.Reset"    },   ...... skip lines
.....   "error": {    "@Message.ExtendedInfo": [      {
"@odata.type": "#Message.v1_1_1.Message",        "Message": "The request
failed due to an internal service error.  The service is still
operational.",        "MessageArgs": [],        "MessageId":
"Base.1.8.1.InternalError",        "MessageSeverity": "Critical",
"Resolution": "Resubmit the request.  If the problem persists, consider
resetting the service."      }    ],    "code":
"Base.1.8.1.InternalError",    "message": "The request failed due to an
internal service error.  The service is still operational."  }}*

*Observations:*
1. On uploading an image, the interface
*/xyz/openbmc_project/software/functional
*is getting removed.
*Before upload:*









*root@tiogapass:~# busctl tree xyz.openbmc_project.ObjectMapper`-/xyz
`-/xyz/openbmc_project    |-/xyz/openbmc_project/object_mapper
`-/xyz/openbmc_project/software
|-/xyz/openbmc_project/software/7b8b7a8b      |
`-/xyz/openbmc_project/software/7b8b7a8b/software_version
|-/xyz/openbmc_project/software/active
|-/xyz/openbmc_project/software/functional
`-/xyz/openbmc_project/software/updateable*

*After upload:*








*root@tiogapass:/tmp/images# busctl tree
xyz.openbmc_project.ObjectMapper`-/xyz  `-/xyz/openbmc_project
|-/xyz/openbmc_project/object_mapper    `-/xyz/openbmc_project/software
  |-/xyz/openbmc_project/software/2327e636      |
`-/xyz/openbmc_project/software/2327e636/software_version
|-/xyz/openbmc_project/software/active
`-/xyz/openbmc_project/software/updateable*

2. Respective failure is happening at:

https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/utils/fw_utils.hpp#L46

Please share some pointers where it might be happening either in
phosphor-software-manager or bmcweb.

Thanks,
Sharad

--00000000000004fef005ba480f3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<div><br></div><div>I am trying to get the running=
/functional firmware version from BMC after uploading an image which errors=
 out.</div><div><br></div><div><b>Platform:</b>=C2=A0Upstream=20

tiogapass=C2=A0(QEMU)</div><div><b>Commit:</b>=C2=A0Latest master</div><div=
><br></div><div><b>Repro Steps:</b></div><div>1. Upload an image:</div><div=
>=C2=A0 =C2=A0 curl -k -H &quot;X-Auth-Token: $token&quot; -H &quot;Content=
-Type: application/octet-stream&quot; -X POST -T obmc-phosphor-image-tiogap=
ass.static.mtd.tar https://${bmc}/redfish/v1/UpdateService</div><div><br></=
div><div>2. Get the firmware version:</div><div>=C2=A0 =C2=A0=C2=A0curl -k =
-H &quot;X-Auth-Token: $token&quot; -H &quot;Content-Type: application/octe=
t-stream&quot; -X GET https://${bmc}/redfish/v1/Managers/bmc</div><div><b>E=
rror:</b><br></div><div><i>{<br>=C2=A0 &quot;@<a href=3D"http://odata.id">o=
data.id</a>&quot;: &quot;/redfish/v1/Managers/bmc&quot;,<br>=C2=A0 &quot;@o=
data.type&quot;: &quot;#Manager.v1_9_0.Manager&quot;,<br>=C2=A0 &quot;Actio=
ns&quot;: {<br>=C2=A0 =C2=A0 &quot;#Manager.Reset&quot;: {<br>=C2=A0 =C2=A0=
 =C2=A0 &quot;@Redfish.ActionInfo&quot;: &quot;/redfish/v1/Managers/bmc/Res=
etActionInfo&quot;,<br>=C2=A0 =C2=A0 =C2=A0 &quot;target&quot;: &quot;/redf=
ish/v1/Managers/bmc/Actions/Manager.Reset&quot;<br>=C2=A0 =C2=A0 },<br>=C2=
=A0 =C2=A0...... skip lines .....<br>=C2=A0 =C2=A0<font color=3D"#ff0000">&=
quot;error&quot;: {<br>=C2=A0 =C2=A0 &quot;@Message.ExtendedInfo&quot;: [<b=
r>=C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;@odata.type&q=
uot;: &quot;#Message.v1_1_1.Message&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;Message&quot;: &quot;The request failed due to an internal service err=
or.=C2=A0 The service is still operational.&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;MessageArgs&quot;: [],<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Me=
ssageId&quot;: &quot;Base.1.8.1.InternalError&quot;,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;MessageSeverity&quot;: &quot;Critical&quot;,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Resolution&quot;: &quot;Resubmit the request.=C2=A0=
 If the problem persists, consider resetting the service.&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 ],<br>=C2=A0 =C2=A0 &quot;code&quot;: &quo=
t;Base.1.8.1.InternalError&quot;,<br>=C2=A0 =C2=A0 &quot;message&quot;: &qu=
ot;The request failed due to an internal service error.=C2=A0 The service i=
s still operational.&quot;<br>=C2=A0 }</font><br>}</i><br></div><div><br></=
div><div><b>Observations:</b></div><div>1. On uploading an image, the inter=
face=C2=A0<span style=3D"font-family:Monaco,Menlo,Consolas,&quot;Courier Ne=
w&quot;,monospace;font-size:12px;font-variant-ligatures:none;white-space:pr=
e-wrap"><b style=3D""><font color=3D"#ff0000">/xyz/openbmc_project/software=
/functional </font></b></span>is getting removed<font color=3D"#1d1c1d" fac=
e=3D"Monaco, Menlo, Consolas, Courier New, monospace"><span style=3D"font-s=
ize:12px;font-variant-ligatures:none;white-space:pre-wrap">.</span></font><=
/div><div><b>Before upload:</b><br><i>root@tiogapass:~# busctl tree xyz.ope=
nbmc_project.ObjectMapper<br>`-/xyz<br>=C2=A0 `-/xyz/openbmc_project<br>=C2=
=A0 =C2=A0 |-/xyz/openbmc_project/object_mapper<br>=C2=A0 =C2=A0 `-/xyz/ope=
nbmc_project/software<br>=C2=A0 =C2=A0 =C2=A0 |-/xyz/openbmc_project/softwa=
re/7b8b7a8b<br>=C2=A0 =C2=A0 =C2=A0 | `-/xyz/openbmc_project/software/7b8b7=
a8b/software_version<br>=C2=A0 =C2=A0 =C2=A0 |-/xyz/openbmc_project/softwar=
e/active<br>=C2=A0 =C2=A0 =C2=A0 |<font color=3D"#ff0000">-/xyz/openbmc_pro=
ject/software/functional</font><br>=C2=A0 =C2=A0 =C2=A0 `-/xyz/openbmc_proj=
ect/software/updateable</i></div><div><br><b>After upload:</b></div><div><i=
>root@tiogapass:/tmp/images# busctl tree xyz.openbmc_project.ObjectMapper<b=
r>`-/xyz<br>=C2=A0 `-/xyz/openbmc_project<br>=C2=A0 =C2=A0 |-/xyz/openbmc_p=
roject/object_mapper<br>=C2=A0 =C2=A0 `-/xyz/openbmc_project/software<br>=
=C2=A0 =C2=A0 =C2=A0 |-/xyz/openbmc_project/software/2327e636<br>=C2=A0 =C2=
=A0 =C2=A0 | `-/xyz/openbmc_project/software/2327e636/software_version<br>=
=C2=A0 =C2=A0 =C2=A0 |-/xyz/openbmc_project/software/active<br>=C2=A0 =C2=
=A0 =C2=A0 `-/xyz/openbmc_project/software/updateable</i><br></div><div><br=
></div><div>2. Respective failure is happening at:</div><div>=C2=A0 =C2=A0 =
<a href=3D"https://github.com/openbmc/bmcweb/blob/master/redfish-core/inclu=
de/utils/fw_utils.hpp#L46">https://github.com/openbmc/bmcweb/blob/master/re=
dfish-core/include/utils/fw_utils.hpp#L46</a><font color=3D"#1d1c1d" face=
=3D"Monaco, Menlo, Consolas, Courier New, monospace"><span style=3D"font-si=
ze:12px;font-variant-ligatures:none;white-space:pre-wrap"><br></span></font=
></div><div><br></div><div>Please share some pointers where it might be hap=
pening either in phosphor-software-manager or bmcweb.</div><div><br></div><=
div>Thanks,</div><div>Sharad</div><div><font color=3D"#1d1c1d" face=3D"Mona=
co, Menlo, Consolas, Courier New, monospace"><span style=3D"font-size:12px;=
font-variant-ligatures:none;white-space:pre-wrap"><br></span></font></div><=
div><font color=3D"#1d1c1d" face=3D"Monaco, Menlo, Consolas, Courier New, m=
onospace"><span style=3D"font-size:12px;font-variant-ligatures:none;white-s=
pace:pre-wrap"><br></span></font></div><div><font color=3D"#1d1c1d" face=3D=
"Monaco, Menlo, Consolas, Courier New, monospace"><span style=3D"font-size:=
12px;font-variant-ligatures:none;white-space:pre-wrap"><br></span></font></=
div><div><font color=3D"#1d1c1d" face=3D"Monaco, Menlo, Consolas, Courier N=
ew, monospace"><span style=3D"font-size:12px;font-variant-ligatures:none;wh=
ite-space:pre-wrap"><br></span></font></div><div><br></div></div>

--00000000000004fef005ba480f3e--
