Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866B9415C3
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2024 17:52:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=foFnW66L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYKVf163hz3dCV
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2024 01:52:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=foFnW66L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=venukovelamudi1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYKV56ZjZz3cfT
	for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2024 01:51:56 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e0857a11862so3503273276.1
        for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2024 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722354711; x=1722959511; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xJpnE3VgOtBr8VZZ0Szy4GwGqECEaVbhRw5SV9rlpMs=;
        b=foFnW66LAHrHCE4D14gxhGEC5hnubMcX2Nr4tCYPEhBylYVLdeSEKyB1ufvPS2gI6a
         1dhGvAR1p3Cp8m2ysm4pi87fw6fEvlSDmxs4KX4og8ug8R8QZxEOiDUyMGWA1ydX7luG
         a8z3gWucVXhfijB8SlLWuDKaFrq/Y6Hbx3yLv6p4Uh1BPVmHBU6FixRtVSI5LTBAPbFK
         SdZ5oC9W21uuPwIIpZ5QTX5pw/VDcWQ1ytdVuVLci1AjhTr+MKyoK07irQPnaCQMA5/E
         CukNwhFc+28xGFBkruxZCH5LLGz5p8fHlsP5btb8LR/3RzBd29uhJxaWL/7ZoQj5GfFD
         9YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354711; x=1722959511;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJpnE3VgOtBr8VZZ0Szy4GwGqECEaVbhRw5SV9rlpMs=;
        b=SpsetpCtRZqvVclsc3OxWxt267odF1Hv9lfLVuCmICmP5AMcL/EByReuDMze1YvQRA
         +LXMkwVbopQ7Jsb2N4mHALdE0ujWyfSPTJ7vUwXNYgzxN6PBLlTukZnfAjy3BSdnNrai
         vFLh0E9siaV3NIClL85W1sQR1tdBBXUxcLdEFgSrmE3vFehRsxXk8rLQjeqlEtQaZpOC
         4ERFtVDFXAwFq7NHmSUg2kw0J/mTAb8cIJqN9KQzvfAU1YfZZAZyin+bbgoNNsh3SNw7
         IULhHK3tjUvVDU1BHOmbhmoIYT9vta76OiqSV1JACAlAaCz5VCiAB4wVyJKJYwXiMrZa
         80zw==
X-Gm-Message-State: AOJu0Yzc6yUQAZVSWYNjvoEQhTClGEVDekCryrlau6sZ6izFNkotJry8
	pjimvUQfwyitJ4Slpv3++LObKlOKw87VrFjgRlCu93EduHSs+Rxe9FGdEcwHDe7LcQ4FxrPF1EI
	qLyUfX2L/7+rObAhK6sko03sZqtrLjw==
X-Google-Smtp-Source: AGHT+IGhJ7hrQL9VnRM/H/sEQviCMyeaLULModSylxZVEXMlJWR4qorgsqAhuiWMYOZgdq7xnW5wuznRQ+wxpRXbhMs=
X-Received: by 2002:a05:6902:1543:b0:e0b:3363:5980 with SMTP id
 3f1490d57ef6-e0b545ae31bmr13484648276.37.1722354711299; Tue, 30 Jul 2024
 08:51:51 -0700 (PDT)
MIME-Version: 1.0
From: venu k <venukovelamudi1@gmail.com>
Date: Tue, 30 Jul 2024 21:21:40 +0530
Message-ID: <CAPs9w=ErdSkiZkEWEhxy8D+4phk04JYp3BASziuPKWVu3iLkaA@mail.gmail.com>
Subject: DC-SCM MiniDp display issue
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000be9033061e78f43b"
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

--000000000000be9033061e78f43b
Content-Type: text/plain; charset="UTF-8"

Hi all,

Anyone have idea on DC-SCM MiniDP display port configuration?
I have created memory for jpegbuffer and video node, added video node in
device tree.
Able to see uefi shell at debug console logs, but monitor not working.
Can anyone please explain the flow of display from server to DC-SCM and BMC
to DC-SCM .

Thanks,
Venu k.

--000000000000be9033061e78f43b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi all,<div dir=3D"auto"><br></div><div dir=3D"auto">Anyo=
ne have idea on DC-SCM MiniDP display port configuration?</div><div dir=3D"=
auto">I have created memory for jpegbuffer and video node, added video node=
 in device tree.</div><div dir=3D"auto">Able to see uefi shell at debug con=
sole logs, but monitor not working.=C2=A0</div><div dir=3D"auto">Can anyone=
 please explain the flow of display from server to DC-SCM and BMC to DC-SCM=
 .</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=
=3D"auto">Venu k.</div><div dir=3D"auto"><br></div></div>

--000000000000be9033061e78f43b--
