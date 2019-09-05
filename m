Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C3AAADB6
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 23:16:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PYR10fw5zDr5J
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 07:16:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uGQCDdKT"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PYQF0D06zDqjy
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 07:16:04 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id r20so3717169ota.5
 for <openbmc@lists.ozlabs.org>; Thu, 05 Sep 2019 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NABvcU/BQewLidCNI9mDo2QwaShG4wWAknCJvmty93c=;
 b=uGQCDdKTqcsJwRCz+Xu46L3KIalOttTH+ELTimJgxeEzkUkB+pbDLCqL7bMNTvyv+P
 EFanBOi4LWD9j91HipfffdgNp+oNpI0wcLJB/7+eMk7EFREW+EBSA+t7qZ4kTPsDxBI/
 QWK9aToA/Gke+EWAH5mHacZNgq1QSrFA3CHZWhGB5ApsRVrO3FCkql10IXxmhZzJncje
 4lkqBAIAQOXYRG8p01wGzthBCOcmCjvsGWOA5DeFdI68+qNaT10wSR4b+RjcdEMSmF5b
 Z70zQ97mQM1IDaoZCJe/82kPOyVKyx/y+Ox1Yaw6eR1BMKH9YUVo/h2UoHBr/tGCXsdh
 /ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NABvcU/BQewLidCNI9mDo2QwaShG4wWAknCJvmty93c=;
 b=U/BBoi6hkNFFn+KPdS0LlkzOdluLGr02hS2U+O1AaAAAOQZEOj6dYdI/tomCcm+rCi
 YB7RIRhitn54+crMbnUH2x3R9uWugf8Foc/3VbyUKIPlVZn6pDwlJ0MNuYgpVCUdTuiN
 aXRBNj9wGolmwCuQF/0ZB0120/eNJYZH990Deeh52uVbGFdjzIEWo1/T9qIyhn2dqKpQ
 HZDZDG76tdgJ9LjHEa/l2KDONKjSSusWjtXALi8ANEVTDdOSw/58EBaglPK0GrLwjeML
 mPj4oYdC2nC10LWGe9s7KdxAp6o4dWq+e3Kz5Ew/UN2kGNksPoLyogXUFGIGQyA1mO55
 5xEg==
X-Gm-Message-State: APjAAAVvCckIje/BB/A0Ah2MLMoZV01g4o89vlZub8LfHJETNMCmU7ES
 Y6rlYWGLnE8vvVT8r5L6eDqRz3FFxwNBTTGiID/NuFSkSek=
X-Google-Smtp-Source: APXvYqzDPzj+QHyw5TWvM5/KguoaIcfsDEUK5n2qkm5BC6E0ITaNJ2ilRHtdR2MQkMmsVfO2ff8RS4MkD7okbpkzjC8=
X-Received: by 2002:a9d:4e02:: with SMTP id p2mr4756547otf.260.1567718162229; 
 Thu, 05 Sep 2019 14:16:02 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 5 Sep 2019 16:15:46 -0500
Message-ID: <CALLMt=pwzWPjgWtfUjX30Cy=ddiO3wvpR3pd7y=dz0a5QQ5spw@mail.gmail.com>
Subject: capability to stop all bmc recovery
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Greetings,

It's a common request among our lab team that brings up our OpenBMC managed
servers to be able to disable all recovery actions on the BMC. This is so they
can stop on errors and debug issues with the host without the BMC rebooting
the host or itself. Our manufacturing team also requires this at times to
ensure the system stops on failures.

Story https://github.com/ibm-openbmc/dev/issues/990 tracks this work along
with some discussion on the requirements.

Up to this point we've tended to give our users busctl commands but as we've
seen, those can change over time and new one's are going to be required going
forward. It seems best for our users to wrap these in a obmcutil command.

If anyone is interested in collaborating or has input on the design direction
feel free to respond to this email or post to the github issue. I plan on
starting work on this over the next few weeks.

Thanks,
Andrew
