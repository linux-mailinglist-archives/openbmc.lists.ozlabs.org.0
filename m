Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133E231E10
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 14:07:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGsjd4cWczDr3j
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 22:07:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SMXWePPD; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGsP66GkCzDqcX
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 21:52:58 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id k13so3881402plk.13
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xvmMG1gI6eQ6uGn706UJE+3AJWOjy0awQKKQ4mo+EO8=;
 b=SMXWePPDflnsCyXY6CzqKRxnm2EzYvg0VW6PFCsXf+7QHoVVdbO5SUVfULc7EBBn5A
 dknqouSURIrFnnG1wh3r4zlMObcAsgCP+h+0ff5zU8ARzf3T5xr9GXAYkApgH49aCfny
 MqDIcpWlhH+qFSbsfRoLyP3uKfL6n+fCpkliixrST8Y2uSkDM82SZB+e4jqgVoFz+1EH
 I2IvxtHoqAqgmkA0HRafpLo5Ho8rUUeWlSzk6J8Ihd5SddGPU08TohLXJ7CaKVEG3tRv
 dY6iKbrtdwWmjYObaAeNR3tC8xfQJojugCrst25HWrK73FzOD4HurIWvIrhKK4WDk1N1
 BPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xvmMG1gI6eQ6uGn706UJE+3AJWOjy0awQKKQ4mo+EO8=;
 b=OQVGm4CMjEFyzN3EVxrMtCNiMF1zoGXzuSxLUao840e4sdwkYdqDhxnfDSd0/a8M70
 /r3PuHcB46CpQKomo1KdLiZEjQ0blrA2x0crL8UYmYzdqq4bXZ6h2W6xghf7RxQShJ8L
 j5hGMKYbsRANYyFedrlwj116W8qD8JSNSl+5/jtTHgLyuqL8KA1dpAQuGS5gHeJXlCSZ
 POTcLlA2/O0wmMCDsRYI74nRRgi7rlI8UOWBGq1SNbd6bgSm4quiBQkSwlherdrk64vD
 9JFXU5kE8kPhKxhvaD60rD32GfjhFxsYcVGmmp1dP6vErcQblJ0SUPovgrBpEQcEkcdE
 FvNQ==
X-Gm-Message-State: AOAM533mNeRoxLbBBDADLMe91mtklIIeUnDquF8dpELShLCqyEIQUs2Z
 QhMrkOv/NEJ7aG1w7KaER7Zy99KNU+s=
X-Google-Smtp-Source: ABdhPJw+C0/QAo/HBbgO0fXQX35kUvqMM0QyN3H+UG/HSCXhSiR4MBg4pJtFWbYmW1rQRbA9xitNMQ==
X-Received: by 2002:a17:90a:1901:: with SMTP id
 1mr9621611pjg.199.1596023573799; 
 Wed, 29 Jul 2020 04:52:53 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 207sm2203292pfz.203.2020.07.29.04.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:52:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.7 0/2] fsi: scom: FSI2PIB error recovery
Date: Wed, 29 Jul 2020 21:22:42 +0930
Message-Id: <20200729115244.357600-1-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Joel Stanley (2):
  fsi: scom: Add dev_dbg in put_scom and get_scom paths
  fsi: scom: Handle FSI2PIB timeout

 drivers/fsi/fsi-scom.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.27.0

