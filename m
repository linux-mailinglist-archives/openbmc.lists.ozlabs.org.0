Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E56489B1B
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 15:13:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXbQK4QL4z2yZZ
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 01:13:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=ppD5TZ9o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=ppD5TZ9o; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXbPv6NBSz2yLX
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 01:12:51 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A2FCF47755
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-disposition:content-type:content-type:mime-version
 :message-id:subject:subject:from:from:date:date:received
 :received:received; s=mta-01; t=1641823967; x=1643638368; bh=WXS
 AdbTOZSRRfATMuiUaW+D7A/XpQN9O3ffs5KnYjSw=; b=ppD5TZ9oVlSJkRbg7pL
 SpJttIttJZNgmahKoKfiaWHjwMUDVul85p9qrdRCHABG2HW+YB1uV6TGVlLUUXno
 OOqZWtnzeS5W55N0Xh7B5VyN+ek00I8sJA3WRHyJHJWkdLN06s6x6/bUi1zFzu0Y
 OZWgrkkP3DGMpzU7U95DDES8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsF06h7DU0Ev for <openbmc@lists.ozlabs.org>;
 Mon, 10 Jan 2022 17:12:47 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AA16847B4C
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 17:12:47 +0300 (MSK)
Received: from localhost (172.17.1.114) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 10
 Jan 2022 17:12:47 +0300
Date: Mon, 10 Jan 2022 17:12:46 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: LDAP groups and roles mapping
Message-ID: <Ydw+3uYSqK44CTHq@nbwork.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-Originating-IP: [172.17.1.114]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Our customers want LDAP groups and roles mapping working not only by primary
group, but also by the membership in one of these groups.
And this requirement seems to me reasonable.

As I can see in the code of phosphor-user-manager it can be easily solved by
searching the user name in the group members list that already received by the
`getgrnam` function. But I have doubts - wasn't this restriction done
intentionally?

And the second thing that seems to me wrong in current state:
Any LDAP user can log in into the WebUI even if he isn't in one of the mapped
groups. Yes, he receives a lot of messages about unauthorized access in this
case, but some functionality is still available to him.
For example: KVM and SOL (It's the websocket's restriction).

It seems to me the best solution is adding the roles mapping checking to the
PAM level and restrict the access for users with `no-access` role that is the
default role. But it will be look like a code duplicity because the such check
is still required in the BMCWeb.

Maybe I miss something?

--
Alexander
