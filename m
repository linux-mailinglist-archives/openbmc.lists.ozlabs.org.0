Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D844F1CD448
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 10:53:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LF7v4BYczDqSM
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 18:52:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=hellowolf@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iGogb747; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LF776P02zDqdk
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 18:52:14 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id f13so8360154qkh.2
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YSQwiWa6GKMaRQ9rSQW2nzmA8XnasOLuYTWEkjnKpjg=;
 b=iGogb747Ri9FJzZdIclHQVU/18cEE5MwsmGBVKjuoiyihigtFTmbv3GHBqNFo7cojU
 79o2WmfeaOOldO/t89lWGA2fHcm4/TR6tuAiRGE4LEv9buX95p09rJKgoPuo9qlpf8m6
 vGSYZOPhD2Jld4X9b1gcHqwFlFpBZzp0D/rCRNSvkOD1W3aQt7JJUdRpwMTizWyeuhul
 5RV0pTilyLKsdA6YapBYVKYAV4XSiPF5mqcZMaS7VYnQWEsvMN9CVjbPTrgLMt7PApq7
 sEEufY/O0OKy/pFuQOqlJZVi+NpqZkar557kUUPsiXRkUarNdlfRcXVaA+pZOAAtmNHd
 7PTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YSQwiWa6GKMaRQ9rSQW2nzmA8XnasOLuYTWEkjnKpjg=;
 b=UQnqcGbe5TQRA3KkpF2fkSCOtcPmt09Y5uBdjJpOM4hrIABsBfncU1wrdaoym9REuT
 lfAWWvRbTIbX9svAKdEMZde9fAo1mgschft3njRo/Jwqawa+KO4LMDV3HVOxXBtai59g
 IcEOAcqAxEE37itFr49YB+2yNFNY//QqqKIZoDKKhhV4OViANFXmU8tr4X5j0v4cjaeg
 KW3AY+XXFxiii12rrvdRA7TGM2X3o105N9CaSO8+aDWHTkhfYgkFc5GyhlO9Pe1EyieB
 VFfH6Yn9pgjDdbkAKDEBhMhVcmSFSjdWIY2S/UjiL9QD+9mR1ulp0GszI483P+BmEoXA
 HHaw==
X-Gm-Message-State: AGi0PuYcVzRW5nqBsK9wV37F7VPLwSIFQuwiwMnQBs/K/v5qdbEj7hqs
 mYYIIL6L8WZ1Ng3zMhvfRNk75BpXcK//9jjJ+7zKT7K4b1E=
X-Google-Smtp-Source: APiQypJHiT2V46km5qlv4qnMVZNdhvpnAtKTm0ihPhEuw/HTkF/vCNMMyf4E8ADYb3kDWiRPM4PVDG2s8dO1BlDNVyQ=
X-Received: by 2002:a37:7244:: with SMTP id n65mr14015412qkc.483.1589187130615; 
 Mon, 11 May 2020 01:52:10 -0700 (PDT)
MIME-Version: 1.0
From: hello wolf <hellowolf@gmail.com>
Date: Mon, 11 May 2020 16:51:59 +0800
Message-ID: <CAC5Md5y9ZWOZaOArSUyN6+=pMnieL0nuY0SVRR7VyDJ-jLLnKQ@mail.gmail.com>
Subject: is it possible to update QEMU romulus host image?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000066e8d005a55b7663"
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

--00000000000066e8d005a55b7663
Content-Type: text/plain; charset="UTF-8"

Sorry to bother All...
I am an newbie to study OpenBMC tutorial:
https://github.com/openbmc/docs/blob/master/code-update/host-code-update.md

Host image was generated:
-rwxr-xr-x 1 root root 27648000 May  8 07:30 romulus.pnor.squashfs.tar

Every steps seems ok in that tutorial, except the last one as below:
# curl -b cjar -k
https://root:0penBmc@127.0.0.1:2443/xyz/openbmc_project/software/9fcad44b
{
  "data": {
    "Activation":
"xyz.openbmc_project.Software.Activation.Activations.Failed",
    "Associations": [
      [
        "inventory",
        "activation",
        "/xyz/openbmc_project/inventory/system/chassis"
      ]
    ],
    "ExtendedVersion":
"buildroot-2019.05.1-8-gaced0552cc,skiboot-v6.4,hostboot-8abecc2,occ-e5a2afd,linux-5.2.1-openpower1-pc12d0a7,petitboot-v1.10.4,machine-xml-eac9377,hostboot-binaries-hw062819a.940,capp-ucode-p9-dd2-v4,sbe-b96edc8,hcode-hw071319a.940",
    "Path": "/tmp/images/9fcad44b",
    "Purpose": "xyz.openbmc_project.Software.Version.VersionPurpose.Host",
    "RequestedActivation":
"xyz.openbmc_project.Software.Activation.RequestedActivations.Active",
    "Version": "open-power-romulus-v2.4-dirty"
  },
  "message": "200 OK",
  "status": "ok"
}
--------------------------------------
Activation is always failed, since I do not use a real hardware device, my
question: is it possible to update QEMU romulus host image?

--00000000000066e8d005a55b7663
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry to bother All... <br></div><div>I am an newbie =
to study OpenBMC tutorial: <a href=3D"https://github.com/openbmc/docs/blob/=
master/code-update/host-code-update.md">https://github.com/openbmc/docs/blo=
b/master/code-update/host-code-update.md</a></div><div><br></div><div>Host =
image was generated:</div><div>-rwxr-xr-x 1 root root 27648000 May =C2=A08 =
07:30 romulus.pnor.squashfs.tar</div><div><br></div><div>Every steps seems =
ok in that tutorial, except the last one as below:</div><div> # curl -b cja=
r -k <a href=3D"https://root:0penBmc@127.0.0.1:2443/xyz/openbmc_project/sof=
tware/9fcad44b">https://root:0penBmc@127.0.0.1:2443/xyz/openbmc_project/sof=
tware/9fcad44b</a><br>{<br>=C2=A0 &quot;data&quot;: {<br>=C2=A0 =C2=A0 &quo=
t;Activation&quot;: &quot;xyz.openbmc_project.Software.Activation.Activatio=
ns.Failed&quot;,<br>=C2=A0 =C2=A0 &quot;Associations&quot;: [<br>=C2=A0 =C2=
=A0 =C2=A0 [<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;inventory&quot;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;activation&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;/xyz/openbmc_project/inventory/system/chassis&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 ]<br>=C2=A0 =C2=A0 ],<br>=C2=A0 =C2=A0 &quot;ExtendedVersion&=
quot;: &quot;buildroot-2019.05.1-8-gaced0552cc,skiboot-v6.4,hostboot-8abecc=
2,occ-e5a2afd,linux-5.2.1-openpower1-pc12d0a7,petitboot-v1.10.4,machine-xml=
-eac9377,hostboot-binaries-hw062819a.940,capp-ucode-p9-dd2-v4,sbe-b96edc8,h=
code-hw071319a.940&quot;,<br>=C2=A0 =C2=A0 &quot;Path&quot;: &quot;/tmp/ima=
ges/9fcad44b&quot;,<br>=C2=A0 =C2=A0 &quot;Purpose&quot;: &quot;xyz.openbmc=
_project.Software.Version.VersionPurpose.Host&quot;,<br>=C2=A0 =C2=A0 &quot=
;RequestedActivation&quot;: &quot;xyz.openbmc_project.Software.Activation.R=
equestedActivations.Active&quot;,<br>=C2=A0 =C2=A0 &quot;Version&quot;: &qu=
ot;open-power-romulus-v2.4-dirty&quot;<br>=C2=A0 },<br>=C2=A0 &quot;message=
&quot;: &quot;200 OK&quot;,<br>=C2=A0 &quot;status&quot;: &quot;ok&quot;<br=
>}</div><div>--------------------------------------</div><div>Activation is=
 always failed, since I do not use a real hardware device, my question: is =
it possible to update QEMU romulus host image?</div><div><br></div></div>

--00000000000066e8d005a55b7663--
