Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED043B5037
	for <lists+openbmc@lfdr.de>; Sat, 26 Jun 2021 23:19:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC6F44g2Rz3bvQ
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 07:19:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=WZjxHaie;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=WZjxHaie; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC6Dn1hdTz307F
 for <openbmc@lists.ozlabs.org>; Sun, 27 Jun 2021 07:18:48 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 24C104137A
 for <openbmc@lists.ozlabs.org>; Sat, 26 Jun 2021 21:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1624742322; x=
 1626556723; bh=sOXdstuCFtHJPrU2YjtCoSjY8xjENVIAAPEdCrs75Tc=; b=W
 ZjxHaienr8wkXirSf10OzigxzvrAbcXlhKESMNE0p0fW65x1nZkQO6biclEtooEH
 gyf2AhHFNPtcgdXb9VC4C9SRhQj2++Tw3n5XRS/IN1Cfj4pIrxCY482/lX7rGY4L
 YmdTHRt5V1A+8kCqjZ/JI92xQdRirnMsk13F+/xU8w=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BsEmB7hZzmpO for <openbmc@lists.ozlabs.org>;
 Sun, 27 Jun 2021 00:18:42 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1D4A74127F
 for <openbmc@lists.ozlabs.org>; Sun, 27 Jun 2021 00:18:41 +0300 (MSK)
Received: from localhost.localdomain (10.199.0.6) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Jun 2021 00:18:41 +0300
From: Igor Kononenko <i.kononenko@yadro.com>
To: 
Subject: [PATCH 0/6] USB-gadget: mass-storage: Support DVD-like images. 
Date: Sun, 27 Jun 2021 00:18:13 +0300
Message-ID: <20210626211820.107310-1-i.kononenko@yadro.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.6]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: openbmc@lists.ozlabs.org, Igor Kononenko <i.kononenko@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The following patches contain several fixes of implementation           
'usb-gadget:mass-storage' and bring a support DVD/BR media-types.       
The type of MMC device will be calculating relevant to backend-file     
image size.   

Igor Kononenko (6):
  usb:gadget:mass-storage: Improve the signature of SCSI handler
    function
  usb:gadget:mass-storage: refactoring the SCSI command handling
  fms: Add TOC/PMA/ATIP DVD-ROM capabilities
  fms: Support the DVD/BD images size over 2.1Gb
  FMS: Add the SCSI Get Configuration command.
  FMS: Add SCSI Read Disc Information command.

 drivers/ata/libata-zpodd.c                   |    8 +-
 drivers/usb/gadget/function/f_mass_storage.c |  942 ++++++++++----
 drivers/usb/gadget/function/storage_common.c |   19 +-
 drivers/usb/gadget/function/storage_common.h |    5 +
 include/scsi/scsi_proto.h                    |    2 +
 include/uapi/linux/cdrom.h                   | 1216 +++++++++++++++++-
 6 files changed, 1854 insertions(+), 338 deletions(-)

-- 
2.32.0

