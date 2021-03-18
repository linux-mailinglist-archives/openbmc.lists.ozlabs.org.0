Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953434003C
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 08:26:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1JVC3ryCz3bnQ
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 18:26:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gnGWVUsm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=rsuresh.opensource@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gnGWVUsm; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1JTz45kPz2yZ0
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 18:25:58 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id f16so6314694ljm.1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 00:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+AWexZjTuwxflRuKh8s6HXzKUUR7OM19ChNum3v3QuQ=;
 b=gnGWVUsm5f05wGZar0O0yXB3sJLC1GRSBONoIGzWRQFLqqQ3295/JGa7h5mcXSDJ38
 +OliEys7INiSeOxAcUOfpKiXsq+CRBZQFom2DuRSnODS2SwSI19Pm8nI5XptZh1xEfUk
 u9KgbH0Jy+MVIz7B2mzLsfpVPiNmZyAVcRsD0uvJ8RF6Chb4j3OXOYDO3H/KivMPvtRG
 9atFifOEJPNnFdSVUvdVD2ODadz4vVhdP9E1Ga9PYgeTOHl8vrYeqNHpyAUBtOWGbzBV
 IwhO9ZoCKTv1kFRuLMDGUzfTVoxAKuPAZ8gIG0kFq2xz2Yz4BGg7/2um9fHbmbGsNsdh
 aYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+AWexZjTuwxflRuKh8s6HXzKUUR7OM19ChNum3v3QuQ=;
 b=JinC5f0lrZMd9yIkk9T0HME3RqQDnz+Mcmv/BZIp7DlKZww6S2Q5DkrqaGvZiJ+Uqx
 HGSN2lw4bGKm/qH2c7sQCboWk5xFbl4jJUXJyT2lqB2ubyGvnJRm3flinuLVNMxLuhyX
 aHGLzDZsOwdxMuGMjwklEeTNDhN3ttbeRaZci2JGm5P3N7n8cu9LwLdqHxv3h31Pzgq1
 ne7Iy91dkES3cUaedc07uCy4jz23RvN0KdKhReZ3LMeMPpRySm410FUgwrQ0IV3qScN6
 naRfKCAddacE7x+mI8HYwzleJSiwwbasOMlSALNsjyNPnxJCob8jiYynRYt5FaRUR/Y9
 EL+A==
X-Gm-Message-State: AOAM531LGuw840jd7VztYhFO612wa0YePLThOJx7uASNLCP1ZyWEjZKT
 9oEA6qm72n5uvsczIazhJvrlyrsh4IXQszgxkWTEtiykp/1Iy9Hq
X-Google-Smtp-Source: ABdhPJyko4lwPrSWDw13XXsb0baXi9fBlCuw32Tr3lKl1RuMLpdPkjZtLG5LrirBHS9s9I7OtRPcqVDiTJyY/rUc+jU=
X-Received: by 2002:a2e:860f:: with SMTP id a15mr4468200lji.192.1616052352219; 
 Thu, 18 Mar 2021 00:25:52 -0700 (PDT)
MIME-Version: 1.0
From: suresh rajasekaran <rsuresh.opensource@gmail.com>
Date: Thu, 18 Mar 2021 12:55:41 +0530
Message-ID: <CALKKegOvNZjg6u3=-QWxnQZWcJSrHqpqf=YvpkT1Kd17bGP6AQ@mail.gmail.com>
Subject: Blocking reboot / shutdown / power-off -- without reboot-guard enabled
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000647bd805bdca820d"
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

--000000000000647bd805bdca820d
Content-Type: text/plain; charset="UTF-8"

Hello Team,

We are working on a use-case, where the reboot / shutdown / poweroff of the
system has to be blocked based on some X conditions.

These X conditions will get verified (may be by running scripts/service)
instantly, when the reboot  / shutdown / poweroff command gets triggered.

Please, advise us on the above topic and provide pointers to any available
implementation.

*Note:*
For the above use-case we won't be in a position to apply the* reboot-guard
in advance*.

Best Regards,
Suresh

--000000000000647bd805bdca820d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Team,<div><br></div><div>We are working on a use-cas=
e, where the reboot / shutdown / poweroff of the system has to be blocked b=
ased on some X conditions.</div><div><br></div><div>These X conditions will=
 get verified (may be by running scripts/service) instantly, when the reboo=
t=C2=A0 / shutdown / poweroff command gets triggered.</div><div><br></div><=
div>Please,=C2=A0advise us on the above topic and provide pointers to any a=
vailable implementation.=C2=A0</div><div><br></div><div><u><b>Note:</b></u>=
</div><div>For the above use-case we won&#39;t be in a position to apply th=
e<b> reboot-guard in advance</b>.</div><div><br></div><div>Best Regards,<br=
></div><div>Suresh</div></div>

--000000000000647bd805bdca820d--
