Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5989235A
	for <lists+openbmc@lfdr.de>; Fri, 29 Mar 2024 19:29:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lfvwEG0K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5pq15YXlz3brC
	for <lists+openbmc@lfdr.de>; Sat, 30 Mar 2024 05:29:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lfvwEG0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5ppP2r7Fz3vXR
	for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2024 05:29:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=u6ZgpvkaaGDYHEOzQJsHwpOK9QGPOGeHiXkxrVeGdKA=; b=lfvwEG0KzcGtCxf/xMPkfizHMU
	IEO8Jvj4pryuyTbBN3MjGVPsnhwf7psjuXFoQl/DD1fq7VmnQZud2Am2tU3jyMuZo1dHJDl0hi1b+
	TrejreAGAvGi/D42fVWZF75jMC7PYYCt82PFVN64R+YDXuLT/MD+QyDK2iRjvwko3/lwOAOdZP8Io
	zUn17F3ZDzu8MYfdVo2gJPlDC0Sjfyf7aRsKnpGv641E4TiABILWIczQY9LllHRHSf5wTRTRdLzIH
	ZYO6YBOOB1zKVvEjbSiK6nf7X8FVvxGkZfW8kFDHgTLtDYSYP104MB413JIUfvAQhnrFGpqjHZs89
	kJDm//9Q==;
Received: from [50.53.2.121] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGyV-00000001bcv-1nOu;
	Fri, 29 Mar 2024 18:29:11 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] peci: linux/peci.h: fix Excess kernel-doc description warning
Date: Fri, 29 Mar 2024 11:29:10 -0700
Message-ID: <20240329182910.29495-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.44.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove the @controller: line to prevent the kernel-doc warning:

include/linux/peci.h:84: warning: Excess struct member 'controller' description in 'peci_device'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: openbmc@lists.ozlabs.org
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: add Rev-by, add gregkh email

Would it make sense to add Greg as M: in the MAINTAINERS file?
How does someone know to Cc: Greg on PECI patches?

 include/linux/peci.h |    1 -
 1 file changed, 1 deletion(-)

diff -- a/include/linux/peci.h b/include/linux/peci.h
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -58,7 +58,6 @@ static inline struct peci_controller *to
 /**
  * struct peci_device - PECI device
  * @dev: device object to register PECI device to the device model
- * @controller: manages the bus segment hosting this PECI device
  * @info: PECI device characteristics
  * @info.family: device family
  * @info.model: device model
