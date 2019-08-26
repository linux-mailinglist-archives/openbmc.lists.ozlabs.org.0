Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7589D3F3
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 18:26:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HHSG5wvwzDqkR
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 02:26:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="lwQyINNQ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HHRS18WszDqgM
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 02:25:23 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6931F4122E
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:content-disposition:content-type:content-type
 :mime-version:message-id:subject:subject:from:from:date:date
 :received:received:received; s=mta-01; t=1566836718; x=
 1568651119; bh=BM+TflCTbYGERPN0WR0zRJHsCvAu/KAng+bgY4DuGII=; b=l
 wQyINNQv60h1N5DT4wdyNOL6PNGzbJdKDOtKssSDSOwn2+hzJgxXWdzK74q124JV
 gsABQ6gM92yIVNIZEdJ/4J8NW2GA9BzZEsTc6pJrDZ7NLIH43LnvVqjJkZFhrDpb
 2E68UEbtk2st7jyjEDFAmPQm6gkV6eOGWPzNRlhEq0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-e5XYecySVE for <openbmc@lists.ozlabs.org>;
 Mon, 26 Aug 2019 19:25:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 72F9741207
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 19:25:18 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 26
 Aug 2019 19:25:18 +0300
Date: Mon, 26 Aug 2019 19:25:17 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: custom ntp server in phosphor-networkd
Message-ID: <20190826162517.GA19876@bbwork.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Originating-IP: [172.17.14.115]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

Our customers complain that they can't set custom ntp while dhcp is enabled on
bmc network interface.

I found out that the phosphor-networkd doesn't allow it in fact and it awaits
the list of ntp-servers in response from dhcp server. When BMC is configured
with a static IP address phosphor-networkd keep a list of ntp-service in the
configuration file of the network interface. In my opinion it is wrong.

I propose to change this behavior: 
 - the list of ntp-service should be kept in /etc/systemd/timesyncd.conf
 - the customization of ntp-servers should be independent from the network
   inferface configuration.

thoughts, doubts?

Regards,
Alexander
