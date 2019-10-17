Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D468DDA2B3
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:30:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tqnq1GtqzDr5h
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 11:30:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EBk5buxy"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tqnB68VqzDqwM
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 11:30:06 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id y22so446768pfr.3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 17:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kk9YNa3m9BedH18oKPQwwRNJiBG09bZY06jh4AUxYuo=;
 b=EBk5buxy2shyCWzpX5DyuMuzSpQ6J4gdEBkcCaQ/+a/ftjjS73NB6yq6itn8c9OomM
 A4wFNjOS8u2+yqbZ/Lt7g7gLnByXdb7vmuA/ygJDUcYci7jmgLlZ6rIZr1eBYh2MgvJ7
 rYTBhewuvuq+wIO4jhd+mZEOg1gHARxyANIGP2GNlnOGmIbuuFC2z4hJewvw4mzphd+M
 AxyayKSzR+Ku7RoxsSk+2hkbvnPbf0wOlKwcGuuNOlklcbxKpiV6JGJAAkna37i42IH/
 bBL/Xwdxj++ePlex+1g1VZL3g7M3rcPQlPLJ9czOqV1QlVeM1r+q+MHoAs2nqclI7eKZ
 OQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Kk9YNa3m9BedH18oKPQwwRNJiBG09bZY06jh4AUxYuo=;
 b=D8ccJO3/ozkP9D9FIDeRxDNcfAT3sJ4e4RCs2VQG967RPpv81uFSCK1UTic98/Hyna
 peAnZkhz6vhC2v1lc9TLUOpAOShHycAc30DM1fmOJRPlecVKeEHbmmffJr/MFGtrtRrp
 YCClpUEfbXxQXEAgChEqjI+InAV9+/eje1/9bAVe0VKTXYm+LTUSN3yJqzffdTCPN968
 JRn5T13C7MpNvN9QGoVFnzMOnWRFtjX+GmHcpQkG5OfvOnlgsnCiY9/F0/rBkxlQT8sS
 oAWL+NUQCm9uEVg7EIzdMutYnG5K3TCgy7wQiz2E7R0eIXIn8QYKDdazI/cxzaPT2q+i
 +IUQ==
X-Gm-Message-State: APjAAAUb2s4Etf3U4IuBQ1EE4Vg5JVW2KqgFcX0ZOTwwXszhU2dUJp3Q
 1yYLbpZHEQcSgbsZrgsZJENtLUTXfMI=
X-Google-Smtp-Source: APXvYqwsaNVhCNwtIM0bj7AlmssGnMDBRVEARhyptMoj6HjuYiuYU0YREANqgEMVJwcw81ktIjNP7Q==
X-Received: by 2002:a63:160a:: with SMTP id w10mr1026753pgl.212.1571272202805; 
 Wed, 16 Oct 2019 17:30:02 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z2sm265261pfq.58.2019.10.16.17.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 17:30:02 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 v2 0/3] FSI Tweaks
Date: Thu, 17 Oct 2019 10:59:52 +1030
Message-Id: <20191017002955.2925-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v2 fixes the alignment of the memory region we've chosen.

These patches attempt to get the FSI master working on Tacoma.

The host FSI device tree needs rethinking, which we can do when
upstreaming the changes.

Joel Stanley (3):
  ARM: dts: aspeed: tacoma: Add host FSI description
  ARM: dts: aspeed: tacoma: Use 64MB for firmware memory
  fsi: aspeed: Disable IPOLL

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 249 +++++++++++++++++++-
 drivers/fsi/fsi-master-aspeed.c             |   2 +-
 2 files changed, 249 insertions(+), 2 deletions(-)

-- 
2.23.0

