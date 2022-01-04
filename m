Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92009483D4A
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 08:54:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSlJL45DYz2ynx
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 18:54:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k3uGdUk4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=k3uGdUk4; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSlHx2HN6z2xKR
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jan 2022 18:54:19 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id q14so137293686edi.3
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jan 2022 23:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2G84p2zGRErP4yA6Wg0Uc5lLIQnETGoBVkFzojdwDYs=;
 b=k3uGdUk4SnFqpGv/Ts097qICCxIWjSrup4YLuXL84rUGeJzZgX7T7lQf4QyOd1KD+C
 QmikrNMvxtzMJIPx9RTuqKKsY05nsyBuIP0uSBH6IejRriC76CM9aUngdeMKR5tO4h9s
 1rqAhe7Id3oGXzW5yAFwNxJteY/k1YxLAwSizGsSwm9Nx6k23kQSrNaImEHN8XHqpEeJ
 WsgoKuxBKnqMcfy1+793w9KlmQPCVTbO6m2D5j/pu62E5/uvCbP/1ux7LUmHbs/Qx29g
 k/PtvD23vF4iUM/mDuNJ6PLj6jJDed6/2wLc9wXPhB98GCP8kUT11YpYQuyL2uy/3rnX
 VVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2G84p2zGRErP4yA6Wg0Uc5lLIQnETGoBVkFzojdwDYs=;
 b=2wuJU3bnNAW5FIptyqDy8K1MWaXSDfkR9y0kXrpDGyVS44SWRnFZxxKW7HvzhrPEgA
 8u6ofO+QnDD0W5kNSYo1Ntc6rWgvqsFUYrWwPhtnniCWQTDUXoQHCrRunC+5ibWhTCAP
 EWtrlEolzrHioTI2lXUwY0YxOmRpTGWXuuTQxkrSy61K7IUIDHg7l6L5iu2i4cqc0Gz6
 dvHX6fwUGGTGzMr+HTf7Jc7N7CbvJs5UdIQthDFAnUJG5cupqQcd6fH0rIMP1Q5jNFps
 8ZRlIYmQgXDRwRzy8bE+qXbZRZtGQdYM4gL9c3hSLP1KwyYQKVZOP3VMkBsgd+/FTLmR
 NRlQ==
X-Gm-Message-State: AOAM532wIJ/2AxuerdikABIduF4OT8KxTW7+L+GlaXLO7MvzxO2fF+46
 GHTb3IU0H4Zy3ebcxgDsnXMjr6w77l8pmsUMTzaxXAho
X-Google-Smtp-Source: ABdhPJztQu2WNeStyyatDquSYqq/UDakYCVFsSqVsYh8xguTJ5QjM28XDffDQk3/e/4Ylpq4XQK8NTRU6Tl8o8EhnTc=
X-Received: by 2002:a05:6402:51cd:: with SMTP id
 r13mr46632716edd.184.1641282855216; 
 Mon, 03 Jan 2022 23:54:15 -0800 (PST)
MIME-Version: 1.0
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Tue, 4 Jan 2022 13:26:19 +0530
Message-ID: <CAA7TbctqbhbfV5e-QH-QcuwgfHPVLj3z6wFAXKMo6cd-=A1ZYg@mail.gmail.com>
Subject: New repository request for platform specific Bridge IC code
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008fa97305d4bcf10b"
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
Cc: velumanit@hcl.com, patrickw3@fb.com, Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008fa97305d4bcf10b
Content-Type: text/plain; charset="UTF-8"

Hi All,

       In our system, Bridge IC will act as a bridge between host and BMC.
All the IPMI commands from the host are routed to Bridge IC and Bridge IC
will forward those commands to BMC.  Similarly, BMC will route IPMI
commands to Bridge IC and it's forward to host.

We wanted to put this platform specific Bridge IC related code and ipmb
commands handling code. So, we need a new repository to add these codes or
suggestions to add these codes in any other existing repository.

Could you please provide your suggestions on this.

Thanks,
Kumar.

--0000000000008fa97305d4bcf10b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
In our system, Bridge IC will act as a bridge between host and BMC. All the=
 IPMI commands from the host are routed to Bridge IC and Bridge IC will for=
ward those commands=C2=A0to BMC.=C2=A0 Similarly, BMC will route IPMI comma=
nds to Bridge IC and it&#39;s forward to host.</div><div><br></div><div>We =
wanted to put this platform specific Bridge IC related code and ipmb comman=
ds handling code. So, we need a new repository to add these codes or sugges=
tions to add these codes in any other existing repository.</div><div><br></=
div><div>Could you please provide your suggestions on this.=C2=A0</div><div=
><br></div><div>Thanks,</div><div>Kumar.</div></div>

--0000000000008fa97305d4bcf10b--
