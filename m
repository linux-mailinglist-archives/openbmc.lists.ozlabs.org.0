Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99D919987
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 22:59:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=RB7RlXb+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8Yx51VC6z3cX7
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 06:59:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gmills.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=RB7RlXb+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmills.xyz (client-ip=162.0.218.228; helo=h5.fbrelay.privateemail.com; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 756 seconds by postgrey-1.37 at boromir; Thu, 27 Jun 2024 06:59:24 AEST
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com [162.0.218.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8YwX5fPNz2yk7
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 06:59:24 +1000 (AEST)
Received: from MTA-07-3.privateemail.com (mta-07.privateemail.com [198.54.127.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id DF5D46027F
	for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 20:46:41 +0000 (UTC)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
	by mta-07.privateemail.com (Postfix) with ESMTP id A19E518000B0;
	Wed, 26 Jun 2024 16:46:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gmills.xyz; s=default;
	t=1719434793; bh=YjZZIOKncDg1UryMrU7Ohy6ZwfjAgWPiGzN3bJy2bNo=;
	h=Date:From:To:Cc:Subject:From;
	b=RB7RlXb+aLOskUh98JyEtmkBj2DiTiw/8ahrghJ5Ym+0y/hq8phmaiuzkauqkq9jX
	 gAcpm5URowzXHVafD9Tutv+08UKmsLtvtdVFrs+s6rbZOnN/kFkCgyQAJNSi9umAA5
	 xtonZppVYgRomnWn2qDWF07/K+Lv/F7FRPjkrwwC7qBFkniyFX9anzJRfRRzs9eiAm
	 nZMh0nNpgGckiDFpmX9jKhxMezTtfH0ARE7pkjbZZxIumtEugMwDTeHJ8GfcJbnCCM
	 dXf+58EN/uXukSyc8kWlw1D5IjOxUWTiPz16QQoq1QF4z3LeUWqkqbFixBvF4i/chu
	 CCt12uHKnEB5Q==
Received: from APP-19 (unknown [10.50.14.243])
	by mta-07.privateemail.com (Postfix) with ESMTPA;
	Wed, 26 Jun 2024 16:46:29 -0400 (EDT)
Date: Wed, 26 Jun 2024 14:46:29 -0600 (MDT)
From: Gunnar M <gunnar@gmills.xyz>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <1403524602.354586.1719434789488@privateemail.com>
Subject: Request for a new vue3 branch in webui-vue
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_354585_416039156.1719434789487"
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev65
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: "sivaprabug@ami.com" <sivaprabug@ami.com>, "Renuka.Sharanya.Pundla@ibm.com" <Renuka.Sharanya.Pundla@ibm.com>, "a.nikhil@ibm.com" <a.nikhil@ibm.com>, "kirankumarb@ami.com" <kirankumarb@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_354585_416039156.1719434789487
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

webui-vue currently uses Vue 2, which has reached end-of-life. The migration to Vue 3 is complex and requires breaking changes. To help move along this work, a new branch, which will temporarily have errors, is desired. This was discussed in Discord[1] and in the GUI workgroup meeting[2].

Kiran and his team have volunteered to sync patches merged to master to this new 'vue3' branch bi-weekly. Thank you, Kiran! When the migration to Vue 3 is complete, and all commits are synced over, this 'vue3' branch will become the 'master' branch.

A version of this commit, https://gerrit.openbmc.org/c/openbmc/webui-vue/+/55438, upgrading the packages to Vue 3, is expected to be the first commit to go into this new branch. Future commits handling Bootstrap, etc., will follow.

[1]: https://discord.com/channels/775381525260664832/776550056391606352/1245423441935339560

[2]: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Thanks,
Gunnar
------=_Part_354585_416039156.1719434789487
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
 <head> 
  <meta charset="UTF-8"> 
 </head>
 <body>
  <div class="default-style"> 
   <div>
    webui-vue currently uses Vue 2, which has reached end-of-life. The migration to Vue 3 is complex and requires breaking changes. To help move along this work, a new branch, which will temporarily have errors, is desired. This was discussed in Discord[1] and in the GUI workgroup meeting[2].
    <br>
    <br>
   </div> 
   <div>
    Kiran and his team have volunteered to sync patches merged to master to this new 'vue3' branch bi-weekly. Thank you, Kiran! When the migration to Vue 3 is complete, and all commits are synced over, this 'vue3' branch will become the 'master' branch.
   </div> 
   <div>
    <br>A version of this commit, https://gerrit.openbmc.org/c/openbmc/webui-vue/+/55438, upgrading the packages to Vue 3, is expected to be the first commit to go into this new branch. Future commits handling Bootstrap, etc., will follow.
   </div> 
   <div class="default-style">
    <br>[1]: https://discord.com/channels/775381525260664832/776550056391606352/1245423441935339560
    <br>
    <br>[2]: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
    <br>
    <br>Thanks, 
    <br>Gunnar 
   </div> 
  </div>
 </body>
</html>
------=_Part_354585_416039156.1719434789487--
