Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E3A6A3A3
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 11:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJMJD6jfFz3c88
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 21:29:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.149.242.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742466554;
	cv=none; b=B9VaqJVogZ1Abw05VZByXpBU3UdfdyFLbSYmqua72qb6BtnMKUZbUy9b1mqDajtaFm3fbUXDrEby5wKb2crTzMM1OcnaYzZGahjT4ZRBnQcWwSSc0YkhTNAF7d9KBr36NAI4UETHxz8apM+ZDIBbjkbJxQEBUAeCoz0mKzord99UHtZMNbIwxOx+PXzD/eTPr8FIDkcGTrV8v2TUU68c/oGZxXx+EKnCR5kdp0tk7WKuZ761CQy+TEiq1mYiAOy6nqZfr2d8HvfrjKWIWhbMn7VDynWuHrFgValjkk03scY08u4jhDx4bn+88zD/M0ovtx9/Gvo9ZoqAi+ZQAPVDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742466554; c=relaxed/relaxed;
	bh=rqzujwt3g/O78fCQGVMVOrVwSDt4WiESxKrrtDIJHVY=;
	h=Date:Message-Id:Subject:Content-Type:To:From:Mime-Version; b=ikYtk+KWq82zOxYMtHNRktkwvI8B1vmro2Uc5kiF7i+yPm236Q3pc3ojRUqvoBGAgin5znbTsiX879tnwVetPx/AI3I6Do/YJL0qmAlIId+y3+cSDG5+FVbS91bULh8NnivVyr6zdviMXK7NxJXfx0022s//z/a+xZkWP80hfOp+mIuNFZEPlp2Ib8lFrqXSG5vxYp7lWY4gRUedmIK7sy56Od2Cm5gQGUtvjIivQ5eT3ihqyRJ/Lk83GHhp75Zw7hydKcdHsDCut62w61/T6BHZ3v4Rn4ncV+bVk3/O5SqK2l/klzdbaxB//7t/Ccr0gWzqTOZZkh3kGUW4e9ODtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=YX+4Bmi9; dkim-atps=neutral; spf=pass (client-ip=103.149.242.130; helo=lf-1-130.ptr.blmpb.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=YX+4Bmi9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=103.149.242.130; helo=lf-1-130.ptr.blmpb.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 616 seconds by postgrey-1.37 at boromir; Thu, 20 Mar 2025 21:29:11 AEDT
Received: from lf-1-130.ptr.blmpb.com (lf-1-130.ptr.blmpb.com [103.149.242.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJMJ72s6Vz2xdg
	for <openbmc@lists.ozlabs.org>; Thu, 20 Mar 2025 21:29:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1742465649; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=rqzujwt3g/O78fCQGVMVOrVwSDt4WiESxKrrtDIJHVY=;
 b=YX+4Bmi955uYbpvtTh/WdeYS0FZgLa0YunzppVFZnBMY2IPBMFMWc/q7IWmZY1gXFG7a8N
 yj/SyDPZugtaLVwST+YhHdvZo1siBKR+Ni1CvrdvswoAWa2+RPfc6RVs2rlQYqq6efnQaK
 ca8ProeMnDliAXyiZcbwHSUF3vIT4xUZws79lVMtaXbARE+3hUvD3QldKQtCJlnabZ0mBq
 MKczN7uBiZAwm9rZv1uI9m8WwCO+AC1ZmqbiEPYJH29D6tIbPpjeSQ65/0DKvJ/U+BQB6z
 it2m8r+RhRNSQXbskSvXNddGweN5OkkQYQRrtnRVCfmvXV90rsbZLEvK9khTmw==
Date: Thu, 20 Mar 2025 18:14:06 +0800
Message-Id: <51dd8bf76aa056fbc966e48132cac2607d2326ca.34c80f52.9006.4a13.8b1a.b7152cde3ada@bytedance.com>
Subject: ipmi auth failure after user name password change
Content-Type: text/plain; charset=UTF-8
To: "openbmc" <openbmc@lists.ozlabs.org>
From: "Jian Zhang" <zhangjian.3032@bytedance.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+167dbea6f+a4b71c+lists.ozlabs.org+zhangjian.3032@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Hi,

This is a mail that to report an issue that we are facing with the IPMI authentication
after changing the user name and password (I think this is a important issue).

The root cause of this issue lies in the user synchronization mechanism within net-ipmid and ipmid.
The original mechanism determines whether user information needs to be updated based on the
file's modification timestamp.

Since the BMC is typically an embedded system using the jffs2 filesystem, which has a
32-bit timestamp with second-level precision, modifying both the username and password
within the same second can cause the update to fail, resulting in login failures.

The patch[0] below introduces a file watch mechanism to monitor changes to the password file.
When the file is modified, it resets the last update time to ensure that all updates are
correctly reflected in the password map.

[0]: https://gerrit.openbmc.org/q/topic:%22ipmi-user-update%22

Kindly review the patch and test it, Thanks.

Jian.
