Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E93A91E82BD
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 18:01:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YTnf5XszzDqjk
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 02:01:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lNq3AuhX; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YTmT01BrzDqhl
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 02:00:04 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id z3so2277487otp.9
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YwxIiGWXY1gFlocmwCxPS3DPOyU5SvnPCMH8qy9gJZQ=;
 b=lNq3AuhXGDXnzrrpggDjawXw0YuUDHcAZgjXKcClkWBno9CwWd2oC20/rOTbO/8X1X
 qZofOKCt4ZBpBJX8nNsCPCeu3iW9HmwQ2QNv/FEpfBfAHM53eDIK2VIlSl2rNN48Quy4
 yW5of80a1mhqzdwXIVl3qfD0MbQHJQ4OmRctTL32a0t53DjqZn1gJ6ownCaOeGfC7ube
 oY193MryJTO3qcyo5s4dwTPC7BPRsDs4p6r5J11+VTaQbi3wg9SmdM06wthQDoK7h16j
 IBzt/iZTfg/g70gC9IWZjBs31YdMBc0S9lHhECA1gWi3M/RWJ+kh87kP8WWdhGIyJ73n
 G9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YwxIiGWXY1gFlocmwCxPS3DPOyU5SvnPCMH8qy9gJZQ=;
 b=UGO93R+uftbwXgwW5yDYQ4lvbkpGvq7Cz2PkqSgFzUUNeoQFyqE1fOizK+CjGU/FUV
 4FlWNAcYLW1VpBoMMKYoW7a7z37wiHUl7vlYSAO0RSXACmsonYIsHrTQdjQDjOOIJ6Yv
 kbTJ1ni/5+uCrIMrW60giZPcarK7cOpkTkTdBI1tDt1rYEzKV8OahLbvtarAGzwxJkon
 JQ7UkF8rsTHTgptEwhC6RM8hDy00ALL4k0+Wf6Vh81TGvx7mDMiHuKolb+YjRZR+jNKX
 s/hSDVXnMMf1l4RWlC8yZ2DbmtoZF9nYUUvaRPB//e+vFZjQ8OTiboDRbLp7nVBhxq+d
 4YSA==
X-Gm-Message-State: AOAM533kD1kr5UYCmrCs0eS68b8h/jiC3ml5HvX0SI3BRw/zko4D2Hno
 VYSHrhSj+Hpd35xkly57R9s0ZzW/Q0jBqqy9rZALp3R3MtM=
X-Google-Smtp-Source: ABdhPJz4pO0CqmmvS0yU4kMITaMfm/8FWRFDNz2ZX4xV/sM8xhw56h2TYyedKyMZ68IqxW0yvnNhF5wRfs5A3S607nI=
X-Received: by 2002:a9d:6b16:: with SMTP id g22mr6693910otp.356.1590767999079; 
 Fri, 29 May 2020 08:59:59 -0700 (PDT)
MIME-Version: 1.0
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Fri, 29 May 2020 21:29:48 +0530
Message-ID: <CAA7TbcvAOF-ThzEyZMkMr4T4XwBxXmCoO0MOL-WmywpFQuKpQQ@mail.gmail.com>
Subject: Sd_bus_call - ELOOP Issue
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000081560a05a6cb89ac"
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
Cc: anoo@us.ibm.com, vernon.mauery@linux.intel.com,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000081560a05a6cb89ac
Content-Type: text/plain; charset="UTF-8"

Hi All,

        We are handing the ipmi commands (Bridge IC request) in the ipmi
module.

        Please find below the gerrit links for the Design and Sample code
implementation of BIC request handling in the ipmi.

        Design :
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/32213
        Sample code implementation :
https://gerrit.openbmc-project.xyz/c/openbmc/fb-ipmi-oem/+/32215

        So, This is regarding the ipmi implementation issue as per the new
design of handling BIC request.

      1. We are handling the command "0x38 0 1 6 0x15 0xa0 0 0 6 1 0"
Netfn = 0x38, cmd =1 is from Bridge IC in the ipmi module. In the ipmid, we
are making new callback(ipmiOemBicHandler) to handle this BIC request.

       2. The Netfn= 0x38 and cmd=1 is verified, we are getting the
commands from the BIC, the same is received at ipmb and ipmid also. The
register call back is also  called. When we fill up the response from the
ipmiOemBicHandler works fine. The response is received at the BIC as well.

       3. But as per the new design, we need to call ipmid command handler
recursively. When we get the Netfn= 0x38 and cmd=1 command in
ipmiOemBicHandler, the handler needs to open the packet and there will be
an another command (for ex Netfn=6 and cmd=1 get_dev_id). ipmiOemBicHandler
needs to send this command

       4. In  ipmiOemBicHandler callback function we are using synchronous
method to create connection, using this connection we are calling "execute"
ipmid dbus method from the ipmid deamon.

       5.  While calling "execute" method, internally it calls sd_bus_call
function. Sd_bus_call returns ELOOP exception due to sender and receiver
         process are same.

       6. As per our understanding, current  sd_bus_call not supported for
connection with the same bus/clients. (sender  and receiver are same
           application name ). Please confirm.

            Log :
            yosemitev2 ipmid[370]: sd_bus_call function called..
            yosemitev2 ipmid[370]: sd_bus_call function ELOOP .
            yosemitev2 ipmid[370]:  unique name = :1.71
            yosemitev2 ipmid[370]:  incoming sender = :1.71
            yosemitev2 ipmid[370]: executeCallback called. catch block
            yosemitev2 ipmid[370]: EXCEPTION=sd_bus_call:
System.Error.ELOOP: Too many levels of symbolic links

       So,  Could you please confirm sd_bus_call does not support the same
bus/clients with in the same process.

       Also, Please let us know if any alternate method to  call the
execute dbus method with the same bus/connection.

Thanks,
Kumar.

--00000000000081560a05a6cb89ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div>=C2=A0 <br></div><div>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 We are handing the ipmi commands (Bridge IC =
request) in the ipmi module. <br></div><div><br></div><div>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Please find below the gerrit links for the Desi=
gn and Sample code implementation of BIC request handling in the ipmi. <br>=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Design : <a href=3D"https://gerrit.openbmc-=
project.xyz/c/openbmc/phosphor-host-ipmid/+/32213">https://gerrit.openbmc-p=
roject.xyz/c/openbmc/phosphor-host-ipmid/+/32213</a><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Sample code implementation : <a href=3D"https://gerrit.openbmc-p=
roject.xyz/c/openbmc/fb-ipmi-oem/+/32215">https://gerrit.openbmc-project.xy=
z/c/openbmc/fb-ipmi-oem/+/32215</a> <br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 So,=
 This is regarding the ipmi implementation issue as per the new design of h=
andling BIC request. <br></div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1. We are handling the command &quot;0x38 0 1 6 0x15 0xa0 0 0 6 1 0&=
quot;=C2=A0 Netfn =3D 0x38, cmd =3D1 is from Bridge IC in the ipmi module. =
 In the ipmid, we are making new callback(ipmiOemBicHandler) to handle this=
 BIC request.</div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 2.	The Netfn=3D 0x38 and cmd=3D1 is verified, we are getting the commands =
from the BIC, the same is received at ipmb and ipmid also. The register cal=
l back is also=C2=A0 called. When we fill up the response from the ipmiOemB=
icHandler works fine. The response is received at the BIC as well.</div><di=
v><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.	But as per the new=
 design, we need to call ipmid command handler recursively. When we get the=
 Netfn=3D 0x38 and cmd=3D1 command in ipmiOemBicHandler, the handler needs =
to open the packet and there will be an another command (for ex Netfn=3D6 a=
nd cmd=3D1 get_dev_id). ipmiOemBicHandler needs to send this command <br></=
div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4. In=C2=A0 ip=
miOemBicHandler callback function we are using synchronous method to create=
 connection, using this connection we are calling &quot;execute&quot; ipmid=
 dbus method from the ipmid deamon. <br></div><div><br></div><div>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.=C2=A0 While calling &quot;execute&quot; meth=
od, internally it calls sd_bus_call function. Sd_bus_call returns ELOOP exc=
eption due to sender and receiver <br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 process are same.=C2=A0 <br></div><div><br></div><=
div>=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 6. As per our understanding, current=C2=
=A0 sd_bus_call not supported for connection with the same bus/clients. (se=
nder=C2=A0 and receiver are same <br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 application name ). Please confirm.<br></=
div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Log : <br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yosemitev2 ipmid[370]: sd_bus_call function =
called..<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yosemitev2 ipmid[370]=
: sd_bus_call function ELOOP .</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yosemitev2 ipmid[370]: <span style=3D"bac=
kground-color:rgb(255,255,0)">=C2=A0unique name =3D :1.71</span></div><div>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yosemite=
v2 ipmid[370]: =C2=A0<span style=3D"background-color:rgb(255,255,0)">incomi=
ng sender =3D :1.71</span><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 yosemitev2 ipmid[370]: executeCallback called. catch =
block<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 yosemitev2 ipmid[370]: <span style=3D"background-color:rgb(255,255,0)">EXC=
EPTION=3Dsd_bus_call: System.Error.ELOOP: Too many levels of symbolic links=
=C2=A0 <br></span></div><div><span style=3D"background-color:rgb(255,255,0)=
"><span style=3D"background-color:rgb(0,0,0)"><span style=3D""></span></spa=
n><br></span></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 So,=C2=A0 Coul=
d you please confirm sd_bus_call does not support the same bus/clients with=
 in the same process.</div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Also, Please let us know if any alternate method to=C2=A0 call th=
e execute dbus method with the same bus/connection.</div><div><br></div><di=
v>Thanks,</div><div>Kumar.<br></div><div><br></div><div><br></div><div>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br></div><div>=C2=A0 <br></div><div><br></div>=
<div><br></div><div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br></div><div><br>=
</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br></div><div>=C2=A0<br></=
div></div></div>

--00000000000081560a05a6cb89ac--
