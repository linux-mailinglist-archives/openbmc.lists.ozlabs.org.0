Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC3131B37
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 23:18:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s8zy6PFwzDqFY
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 09:18:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29;
 helo=mail-yw1-xc29.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fo5R6TVr"; 
 dkim-atps=neutral
Received: from mail-yw1-xc29.google.com (mail-yw1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s8zD494mzDqFY
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 09:18:16 +1100 (AEDT)
Received: by mail-yw1-xc29.google.com with SMTP id u139so22538849ywf.13
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 14:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KgwPH8H6vNIfPF1qb6Q4NB0ehp1ycv8O8jDYIKl7g6M=;
 b=Fo5R6TVrSPmDqH0fL9NfxJhxsiwEJBNuaY4lf1uaZoz6HEECza9heuUUSTepp4HBTJ
 aqoRMQmHXXYiqOajVu6nxGthGhgbSDWKkQSnskyaEqEraLcJGXJTs0R+KL0g0S7fp3Z5
 1S8Al762H/1hq5mH8MamqwanKhNMtxy18pSMgjysmhimNYFcOptUlQhBSiK5dlvPrYOK
 QS5TlwgG25h/0Y2VJN4BsRSK0hzEn5tP7tFproj5RrdbF9M/F40CpmeGM5LW4Ww89JrO
 j0UH4S8hxxSXpALzk/UWwjuzIhnhf/WVJgGCFt1i/j0aC3LJbxSEoE3a6G4Ct6ORZKGT
 yvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KgwPH8H6vNIfPF1qb6Q4NB0ehp1ycv8O8jDYIKl7g6M=;
 b=XZ19wlTa4K6svVA1IaH+6RxcBiwACpcFCQfiQ2dsO8c2H+5jvlv8+C1OVAQtVlg5kB
 Kxyzh52HgXHAAo/aEBiIERrvU4DZzg0BfAmaSQznZ0L1MySK7Zu1QlK/tlVQv8ozD1Db
 4227Tk9Tokl/iMk6RCHwrVwdnRycsNMWmIn3WTPRvK3aA2rEvbLgvmYZvgJa+lDKu4ZU
 zWVna6LphkRIIdi9pfLrRIP+o83mSoxaCCuBoZm5ETDsJcBonqVm2z5gBzcEq3zh2qrY
 8YPumef6Q/CxepWwzx2PLeTJ6VM4eFn8K+1FVF75qh6DOGMslbJPZHWkloxzp6V2o2wp
 XGvg==
X-Gm-Message-State: APjAAAX/ZuJhNQJ/DUzQkiVlE0x+OFQzYRA0QeRaE8fpL0enr4UF4LP/
 cSbg0sMQWx7qICQYHCJ6dmh+6M+mWf7RWKyE588=
X-Google-Smtp-Source: APXvYqzOzuPtUJdL9swc0HD7aw27UUuDcV3LUCQv/9bQzhHz0CVjZ/I90rjEYDFZXlWgZg+UJ91NORMO1bMIuHIclDg=
X-Received: by 2002:a81:9b88:: with SMTP id
 s130mr79991433ywg.103.1578349092557; 
 Mon, 06 Jan 2020 14:18:12 -0800 (PST)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 6 Jan 2020 16:18:01 -0600
Message-ID: <CAMTupoTd6P4bV2PBA_W-jmtPqye67mAszyaE4f5o6bR+hABNrw@mail.gmail.com>
Subject: Change GUI Workgroup meeting time this week?
To: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000fe55e8059b800880"
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

--000000000000fe55e8059b800880
Content-Type: text/plain; charset="UTF-8"

Hello all,

Due to meeting conflicts, I would like to change the GUI Workgroup meeting
time, for this week only. I suggest meeting at 1PM CST (11AM PST), though
any time in the afternoon works.

Kathy -- does that work for you?


Regards and happy new year,
Jandra Aranguren

--000000000000fe55e8059b800880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,=C2=A0<div><br></div><div>Due to meeting conflic=
ts, I would like to change the GUI Workgroup meeting time, for this week on=
ly. I suggest meeting at 1PM CST (11AM PST), though any time in the afterno=
on works.</div><div><br></div><div>Kathy -- does that work for you?</div><d=
iv><br></div><div><br></div><div>Regards and happy new year,</div><div>Jand=
ra Aranguren</div></div>

--000000000000fe55e8059b800880--
