Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C33202FF195
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 18:17:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM8G24xSPzDrQt
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 04:17:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VC/wyrGt; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM8DT66JxzDqcJ
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 04:15:52 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id d81so5515221iof.3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 09:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=k+Bc/ZxHgUIwslvcgx0x1cT37lIKmDbzrWut6QXRnEI=;
 b=VC/wyrGtdw32ShUS8ET2QZFITtL4nMW/nBEXS5zKxTtZS2ZY5HwdYMwNM88uHfSx78
 j5CXw/ycamjQPKLnczd/YHly8F3ND37vgHM8e/ube1iAjwyVOuk46tsFjY+r0EsgmYkx
 uTEO/zaN8nefWOzNT2FE3Gu7zE63W7nsc+ZwfGVacsnZvvCX6cnzFRVE9UJc4Gzp8eIE
 ZaILF1AUoJGv8fhirNUqs3Gugl+yQQAxkZVJbd+jCw8qLlXkdgIvfq6Dko0AXOQqK2ED
 bF46j4wWznMif2nc7gpIc2be4lwn19GPTb9NQ1ljpruPWKquFoOCV2k5eV11ftPYM8aJ
 q+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=k+Bc/ZxHgUIwslvcgx0x1cT37lIKmDbzrWut6QXRnEI=;
 b=Pz1GoGBAvmXSfsbhvXTNuAD3uxWFTQgWAhY/WPybu856xSRlAK6JeArOM3VivFKSyn
 jcEuTusDDYhOSjJVOBjqYHb/pw7q78ORS4WRznVBLLDURnIKAZLc11w1MQLChuQYkoYk
 lWBf+gHLZJ9KTqe4qnp4bA4zX/qLhVHCzSdeQOXS0Z8IReF/95neAXvryJd3AhIoydBj
 NwwiwbcFTs7T4X7nLUeMW5s9Erk36xeqOwp19cyGcify5QqFS8MtA+lUbOw+4vDjWRkl
 aESQZt7gIIKmy3cWfaWKK9SULf3uGSOJXp6Zna9TQkHy/804xV3qVXAbTiCzEvMmBJq2
 rotQ==
X-Gm-Message-State: AOAM530hFsV0zMO5czgccSiPG0cXkPyTbr+fmNTUOifB7D8uG8Jh/JH/
 WnMvCjccjuZdya1gUU7G7v1RO2tE+EY=
X-Google-Smtp-Source: ABdhPJxkLGYTI3QBrOm/nfCYr7qp5adfuOiNwyXNSwt7KZxE6W78p9CsgLTjxsf08lSN3Xudn8fC+Q==
X-Received: by 2002:a6b:da08:: with SMTP id x8mr412599iob.22.1611249348050;
 Thu, 21 Jan 2021 09:15:48 -0800 (PST)
Received: from [10.13.18.4] ([70.39.110.80])
 by smtp.gmail.com with ESMTPSA id k8sm3244105ilu.4.2021.01.21.09.15.47
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 09:15:47 -0800 (PST)
From: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: YAML Parser
Message-Id: <65A10B34-BBA9-407B-9A9B-C3B7AB282F52@gmail.com>
Date: Thu, 21 Jan 2021 10:15:46 -0700
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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

Which yaml parser library is used by obmc executables?
Which recipe includes the library?

Mike
