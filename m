Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF12E40D3
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:04:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zm9Q3j8zzDqmX
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:04:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dkPevOfg"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zm8f1cRDzDqg9
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:04:01 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id x28so375675pfi.12
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fy3Or77JIINBuGbnLlYQYDKujjhHfaAoXfZ1dth8eHs=;
 b=dkPevOfg52LCSOKPzuNoodSFhR4YrNGhLXUnrTY1XZUHPl580ei8dxVBLmd/JWt7TK
 nEFFMnAtZprB8HEwHyPbbBKPW2wYMG3UnrzckJkKD0NUNuinzoP/LnyqqnWrMRRzSyqO
 6lODA1gtb33J9FBERY16VGqwnqKnpPhsCPHTDHe1NOa7CPTSnq/oZDCApOTqYKTyu02z
 clPJ1N1vgx9WwDaKIDtJxHQpkc1JJ5QwWyVB938MOGhw9tS7Rr7BlI1tSoYsChwvoX58
 NVZSWvG/iIDmFwk0Tpnxt52sKYb9KzXV+PA3Y4VxTww2G/w/vUEu1kAJSoFgJ1a2ddT7
 FpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fy3Or77JIINBuGbnLlYQYDKujjhHfaAoXfZ1dth8eHs=;
 b=Nk8NJpdTJYWdelebHLFZK6mpvTEBpdeIj/11+/nQ7NDQIDQoezny3ssTyTf5B3lr0n
 9+sb0d8lYB6JVFT3Ih5iPKeluJd9WlqNyBlUE+A8TpIDeXZc9Silj+IGmWz7A1w1SwL+
 jwW6+eqnV2yew1qM/CRZqvLw3tjtScSCoyOpIVagcFvd75CAFw3w0aRTtgwe2rt+JfQu
 cf1Pp7hxCopfUtdINRswHftycV/oqEQPkrpg/H2ZlE9VxVQ2KdGJWm9JrbAI373fsBOx
 M2lew4qCKTohSOLPMytm27FjE285ZJex0WXa4KHm5ZRvWIgiTV+PLnSKpI3QuAqjMTHL
 rlJQ==
X-Gm-Message-State: APjAAAU1bv1vE+UMrTklSdd1uOv9q6BHxYbhWJDBTQmbBCyKTjYfoNMH
 06oW3Y9hCR66rBAMdfHdGNQ=
X-Google-Smtp-Source: APXvYqyYz9nPi2px9dHP7sJOLXz4tDBD79Kj607K3V8ppxAZSpZGvnFL/wybmi5g5vMCIeAG1ipkwA==
X-Received: by 2002:aa7:96ba:: with SMTP id g26mr990716pfk.45.1571965439371;
 Thu, 24 Oct 2019 18:03:59 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l22sm231786pgj.4.2019.10.24.18.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 18:03:58 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 0/7] AST2600 FSI speed improvements
Date: Fri, 25 Oct 2019 12:03:44 +1100
Message-Id: <20191025010351.30298-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here are some lightly tested improvements to the FSI driver that should
improve throughput.

They apply on top of the previous FSI series I sent.

Joel Stanley (7):
  fsi: aspeed: busy loop in the write case
  fsi: master: Change default divisor to 14
  fsi: aspeed: Enable relative addressing
  fsi: aspeed: Only select OPB0 once
  fsi: aspeed: Avoid copying read data twice
  fsi: aspeed: Pass fsi_master_aspeed insead of base
  fsi: aspeed: Special case repeated full word reads

 drivers/fsi/fsi-master-aspeed.c | 131 +++++++++++++++++++++++---------
 1 file changed, 94 insertions(+), 37 deletions(-)

-- 
2.23.0

