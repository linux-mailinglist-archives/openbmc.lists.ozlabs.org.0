Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F571BEC2F
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 00:53:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CDLq0yBfzDrBd
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 08:53:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=WpnpiBxT; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CDL82Rh5zDr9S
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 08:52:25 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id d197so2154977ybh.6
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 15:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pwX91t83w5liogC8iJNpFd6CRRd+QUAcxUxyUsK6Btk=;
 b=WpnpiBxTTc/+IEpr+PB2Si8bXD80QcbLfl0MgO6xGTMM4jrBpHmAAKTsbAsEzCS4LA
 PZSuc4vs/tVa6/CrJWTUDl2ak8uLUbGLlyYOXLPCOhpLX9WQr66dQSvioeV7giRyM8U6
 NiR55VFDi7vhVX2hpaL8mbkO6B/AZPt7n6vj4sMDFZo5fevXOmIVRFlIcSFWsWGXKhyz
 RzOR92JP+t6uXdV+gnVd7p58TG3eqyIyBCoecU4d5qRmMTaqWI3/CFae55+szXb2qPOw
 6J0DTET34TpgyEXJk9+iyF+iUnEMql7BelNLxFrOIHsCcFUqGPlsNjWUKvP0R68Y8eHx
 jqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pwX91t83w5liogC8iJNpFd6CRRd+QUAcxUxyUsK6Btk=;
 b=bpDkV0xolt/JSxQFBzPS2nDg0BvYJkyQNhRl3KQl/IxRW8P4vnUW6wQxBv5UjqniVh
 6z5dvmQ5TVZOFUPCNwnXGHPSw2wmgVt9tJZxZyMhtdCM1uCyVH2z4+zKzMCPk6vaaVIj
 m/bvfYgwor0YbtBirj0y3VY377gUA6/J/YJOfB3QItQCuwiWLpp8FhouPxD4ohFbakqx
 nP8ejn4hczNJo+EPoC0rVEJ93GMb6InUSmUJ+YfOZKZTrl3BrRwYi0EGHFZjsVWtn+di
 +bKFIWesBtB/RLZFKR8P8kyqi/2INqzRpt1+UUcxBP3+AZspZIb7C6Id/zPNijQbaEir
 R16Q==
X-Gm-Message-State: AGi0PuZg++e0rJMiU1sLu9m/BX1A+DlZgS5XM34Ye0xl7QmnhO/ouF1u
 gX2UWTBUSP9bY7sKKhX49dlbspkd4F5R3m7ijzHk+fth+RE=
X-Google-Smtp-Source: APiQypLSDeYbc7G4T5O7vsT0F5ub+zo0pZJeqI0l0TZGbmysVNm4Kenn1QKomWoycDFZjvtqy2BZ620QCDIhUd9Aj1w=
X-Received: by 2002:a25:bcc8:: with SMTP id l8mr956476ybm.225.1588200741444;
 Wed, 29 Apr 2020 15:52:21 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 29 Apr 2020 15:51:44 -0700
Message-ID: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
Subject: Multiple BMCs in a system: IPMB? Redfish? MCTP?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000719cb05a475cd93"
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

--0000000000000719cb05a475cd93
Content-Type: text/plain; charset="UTF-8"

I've talked with some people a while back (long while back) about multiple
BMCs in a system.  Either for redundancy or managing separate parts of a
system.   I'm wondering what other people are thinking in this area if at
all.

We are considering similar designs and I'm looking into options for BMC-BMC
communications.  Some BMCs may not be externally accessible. Here are some
options that we've looked at:

   1. i2c/IPMB
   2. usbnet/Redfish
   3. i2c/MCTP/PLDM or something else?
   4. internal network via switch chip/Redfish or MCTP

 I'd like to reduce our use of IPMI so I want to avoid (1).

----------
Nancy

--0000000000000719cb05a475cd93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div data-smartmail=3D"gmail_signature">I&#39;ve talked wi=
th some people a while back (long while back) about multiple BMCs in a syst=
em.=C2=A0 Either for redundancy or managing separate parts of a system.=C2=
=A0=C2=A0 I&#39;m wondering what other people are thinking in this area if =
at all.</div><div data-smartmail=3D"gmail_signature"><br></div><div data-sm=
artmail=3D"gmail_signature">We are considering similar designs and I&#39;m =
looking into options for BMC-BMC communications.=C2=A0 Some BMCs may not be=
 externally accessible.=C2=A0Here are some options that we&#39;ve looked at=
:</div><div data-smartmail=3D"gmail_signature"><ol><li>i2c/IPMB</li><li>usb=
net/Redfish</li><li>i2c/MCTP/PLDM or something else?</li><li>internal netwo=
rk via switch chip/Redfish or MCTP</li></ol></div><div data-smartmail=3D"gm=
ail_signature">=C2=A0I&#39;d like to reduce our use of IPMI so I want to av=
oid (1).</div><div data-smartmail=3D"gmail_signature"><br></div><div dir=3D=
"ltr" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div>

--0000000000000719cb05a475cd93--
