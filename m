Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEC67A10A
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 08:06:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yQzG1hXdzDqSh
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 16:06:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="utcNRA9g"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yQyT00QXzDqKK
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 16:05:19 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id o9so21917984iom.3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 23:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ElZqvgRGBZhlvK/ZLtKOA+MaUfdCCd1Z9SlHomwijfI=;
 b=utcNRA9gf9wQD63PNrbxlKoEAJ/mV5tdEpIZlJ3iGiBzEjFpNwHaOWSKid+6VIvjN4
 /jLgrURhhzDxVBL3/nqTdEjDOtkxC3pETeNkBRY9qbvo0Kl+U6CNqMsdzWRg8IUJqvi9
 cf+X3feYqVjmvBPJxfFutKF7qHDEOMiNO2S/c8V7HXe8wh5HV9kWvJ9XZ+//JjNL/V7M
 uEd2E8b1uoFgEbBcu6n2D3h3bh6gowdgn1koSSusSS05RSO0tjgea/jCugYsc/Nvy1by
 4TX6z7iTd+r+0ZHSttQiZSAukS0Vi7XdFzevF/MYNt8TXo3GoJCdU5pff/WbN6YC7npT
 YajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ElZqvgRGBZhlvK/ZLtKOA+MaUfdCCd1Z9SlHomwijfI=;
 b=JluDmDrC6RKVjIlEl746cWpv3yM7ypawcH5BCVEJRyVmkYbx/BzNe/mQCuDD43fam3
 d9CXFAqAMf39MO+XqhXlfYlsUGs/l4x0/r3MvcmXN2Dr/jf2tnQKQ8am5wT2UL/b2u8Z
 r5refSZDfUXarxUrLI+BxPmoYFqji415bbPkYVP0S0AOBCE95UMZN97fyZ6xIa0hTQrv
 rfoGBV7M7xMnNOPcLhrzRj1dsBwYL5CfNbr2n+2S3nKfai+crs2Td5xI84udBEnLJkQT
 nZcJ3fWcyt/8aWRVzeN6ilkPhOXXXVA7eOG8l9o7IpE8Tr7hRDlOXO/QVttwLcKgTE1U
 eoAQ==
X-Gm-Message-State: APjAAAWScwb00yvSmC3e8umBtMiJZ3sc0Bg0SUgNef+Gr0GWrCKNhVqg
 B9kLhgHK44K1GVkDYOY4X+SynG15as8w1xw3wcR3Pw==
X-Google-Smtp-Source: APXvYqxCBIeugaTMMN1Mo9p0dE6dtLCJKE4aGIHH+PVfm7jf1L0x4BAKvBugRHpvbNHPk2XHdx0evGsby5mHuZRJf3M=
X-Received: by 2002:a6b:f80b:: with SMTP id o11mr96537240ioh.40.1564466715376; 
 Mon, 29 Jul 2019 23:05:15 -0700 (PDT)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Mon, 29 Jul 2019 23:04:49 -0700
Message-ID: <CAGMNF6UZ6PV5+0RcpOOPwhM7rd7Rf4tX47hPeg_bJaiQXn-Kcw@mail.gmail.com>
Subject: [Telemetry workgroup] Gathering requirements and interest!
To: Neeraj Ladkani <neladk@microsoft.com>, vishwa <vishwa@linux.vnet.ibm.com>, 
 srinivas k <srinuklge@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi there,

As we found out and discussed in the workgroup meeting, different
people have various goals and requirements in their telemetry
collection from BMCs. We would appreciate if you could help us fill in
the following spreadsheet so that we can have a better context when
making design decisions:

https://docs.google.com/spreadsheets/d/12gMMXB9r_WfWDf5wz-Z_zXsz6RNheC6p2LKp7HePAEE/edit?usp=sharing

It is added to the telemetry workgroup wiki page as well:
https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group

Feel free to raise any questions.

-- 
Regards,
Kun
