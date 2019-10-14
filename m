Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD1D6428
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 15:34:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sKKd0dVFzDqw9
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 00:34:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mAIaeAbd"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sK362MFlzDqn5
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 00:21:54 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id x127so10403801pfb.7
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 06:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tlq4mfNMM+SAlK/D032Y49S1NmhqxSd7nOk/qPYaTuk=;
 b=mAIaeAbdAydJO/pD+P2bZAhcrNMDHaytn68XS31dPCUQ75xPIRUfkDmbKdoWUcNX+0
 4ozY2BGSNLyMPeYnmsyIa3NNPqwhu/4ZXEOxHX8VcFaoyc1sKne2iB/toyxzm8na4DDA
 J+BzynaMhAcpnrNF7IrpTxg9KmgVxXDq27tumpgwH+1zQGbWcE0+shxW+1vdm7wgOxMy
 nhXlLPFzi+xtlQUZxspBochvwqWtZ4d5EE8Dr5Iu+OCS262HYPfE7rZuVzd655VE56kZ
 sJmRdbkdBh5pO355+lu16pd7cqY4QSJ/BPkprWZxTMTm2KGpTRfYgjGvaUnJFwxe4ZEr
 +cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Tlq4mfNMM+SAlK/D032Y49S1NmhqxSd7nOk/qPYaTuk=;
 b=pZ5Qm0IUpjHoUKP+71oPco5gDuSbgEM3XPdf1zBQx567ZWsTGgOfBBeDFDOFiC8MHg
 ATSjgtwhC7mF25kkLnK29JSH9f2OS0XdAY1k9IhS7YDW/RvZqn5QcoiuPa6z6QNxARyJ
 SH4DdhswJlvNsKMPJmSlHVGU3jJlr1ahjxpqYdfTAIEMXueDNWMBXiVS9t1ZNrxJN0zi
 lSfNtxo6kRtrL6TbJo30n+qnuHcS0a/YxWSd9100C4XuGtY6ybRT52a47Y3umEDnlDHc
 OwcPH9U5LyULU9ESZscKXFeCqBFeHm18vLnvS9Fp8f/qhNPueh6aZCQQAnknxwkv+ZfL
 34ng==
X-Gm-Message-State: APjAAAVEEKCN1ys2bD8mvXywimXU6D36Smnw85UG8VfIa6V1DVywmMff
 qLKWYIAiqyGRc4zuLmNig5JC2kSylvQ=
X-Google-Smtp-Source: APXvYqyOZx9BufcqavB84Wh+STAxHMQ+ScVpJL9LAV+GS2asKAUuGqVjx61KZP4pE57azMddPYhiTg==
X-Received: by 2002:a63:ce4a:: with SMTP id r10mr16045471pgi.82.1571059310108; 
 Mon, 14 Oct 2019 06:21:50 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id i187sm9322548pfc.177.2019.10.14.06.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 06:21:49 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 0/2] FSI master tracepoints
Date: Mon, 14 Oct 2019 23:51:38 +1030
Message-Id: <20191014132140.7618-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The first patch removes the base pointer from the tracepoint which I
don't think is useful.

The second adds a tracepoint for some status registers when an error
occurs.

Joel Stanley (2):
  fsi: aspeed: Remove base from trace
  fsi: aspeed: Add trace when error occurs

 drivers/fsi/fsi-master-aspeed.c          | 12 ++++++--
 include/trace/events/fsi_master_aspeed.h | 38 ++++++++++++++++--------
 2 files changed, 35 insertions(+), 15 deletions(-)

-- 
2.23.0

