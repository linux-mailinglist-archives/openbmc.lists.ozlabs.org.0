Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B82D860F
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:52:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tGzS3LLjzDqpp
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 13:52:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DfD56DxT"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tGys25tYzDqj4
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 13:51:31 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id q24so10509891plr.13
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 19:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5CFB1n85lOD4vYPtlBQ+b0FCAACj0jWwaecYtzIkLNA=;
 b=DfD56DxTYRmGuor//mn3q/9wt02G1r5yq5Ivxg2kyC36X6toHSBV1OimWwhLIyNOdU
 g0A1XWfuCcdztFWFBKLjEzswmB4e/9Fv7RJ7qSIW40BX9wHAi83OMubML/APpBG2hJPe
 PNA6uQwxpB93AjDDOPln9qkUjeaEyBGXEpuYBZvuNEE/+bG+J0Nm1TRo5bxcLbrjKaSM
 1AW1UCqEsXIfE/1sL/iCk77wsMzRQ0tQUgLwblfX33oCNhjbbs5oRDfvcLhGE/nZymSs
 85ygArbNarkCDYwJM/3C2BPiBHj5WdWTEUS/b5j6Uxp0x11aGckxq0jhwyhJYDJiMsK1
 tBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5CFB1n85lOD4vYPtlBQ+b0FCAACj0jWwaecYtzIkLNA=;
 b=o5L13tdQ4DsLQpChCsFMODy5et7Z8tcjlX0bcwl8DqVaKarsLysI8dxKX5hsxVgt2m
 f2HPfVmzkkFKLoH8L9vR73xCL0wsxLsJRRzqHIqXlzKc7xWgDFWq3W+vNG/vys/ZqQa6
 /L7R+uEb4YBQi/w6/bRPKVw8VD7/tIV9rIlqINk+05RhfsXeUhHrdpk6Gg4t6g+o/gdV
 6qPNHi+vlEbhqnUYJk+ob+j9L4Pn173vj5roQ4CG/QyuxzaThkFRfp/LO66M6S0vl1H6
 z1wOSLCS7J72J666zsNsDFN2Q/le2DuFprlt1x81zWt20uDp+ZDYRujm2ieRUc+ZsU4/
 np6w==
X-Gm-Message-State: APjAAAXww4zg+P82tvF6HQclFriVWY7hTN0WuY+Dkl+wxSxFF/DkVOSH
 +SL/ty2JCh/DEYX4QcMlBnt4TdBtp2w=
X-Google-Smtp-Source: APXvYqw76j1rO/iu5Q+3N3LSiprGKohCxbEuYagftdbpQOlWH8vjgiQoX/leZ3NNDT3jespqBNydTg==
X-Received: by 2002:a17:902:7084:: with SMTP id
 z4mr37338972plk.15.1571194287769; 
 Tue, 15 Oct 2019 19:51:27 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id f185sm30269191pfb.183.2019.10.15.19.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 19:51:27 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 v2 0/2] FSI master tracepoints
Date: Wed, 16 Oct 2019 13:21:19 +1030
Message-Id: <20191016025121.16564-1-joel@jms.id.au>
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

v2: fix review comments, endian swap in patch 2

The first patch removes the base pointer from the tracepoint which I
don't think is useful.

The second adds a tracepoint for some status registers when an error
occurs.

Joel Stanley (2):
  fsi: aspeed: Remove base from trace
  fsi: aspeed: Add trace when error occurs

 drivers/fsi/fsi-master-aspeed.c          | 18 +++++++++--
 include/trace/events/fsi_master_aspeed.h | 38 ++++++++++++++++--------
 2 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.23.0

