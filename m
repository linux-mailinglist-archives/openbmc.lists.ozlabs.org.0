Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C307CAA439
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 15:22:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PLvD0ZvfzDr4Y
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 23:22:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="LQpLyfIp"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PLsz2X8PzDr2h
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 23:20:55 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 30BE2435D7
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1567689649;
 x=1569504050; bh=Fq7WPeSAvt61chEyb219wqp+f/1fKTN+4BPZufHWq+w=; b=
 LQpLyfIpCEFnI1W5tJXi5kR5N4Btuef4NJtqSelxzEShZnsDCQALfGQkfHoSLmzd
 7BN0FG+LGn1eSYSEmr/6616aTFks86Z+8xV5mezqyUbBWxV9IRiSr9g7H1tidI/0
 Qf1jmaqA8mg12NDP3TQlkqjTLdLpKzdlVb5/IpmIBgs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDepKV1Hn4eT for <openbmc@lists.ozlabs.org>;
 Thu,  5 Sep 2019 16:20:49 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DC36F43132
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 16:20:49 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 5 Sep 2019 16:20:49 +0300
Message-ID: <a0c9b7f0ce642d219ed6c409a34442adea5611af.camel@yadro.com>
Subject: exceeding match limit on watchers
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Thu, 5 Sep 2019 16:20:43 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
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

Hello everyone!

Our VESNIN server has a lot of temperature sensors on it, so we tried to attach
watchers via yaml for them. The sd_bus_add_match() returns -105 (ENOBUFS) which
represents exceeding 'some limit', according to the the doc. First of all we
tried to figure out why it didn't work, and found that match() from sdbusplus
didn't raise any exception/warning/log, etc. in the event of errors, and just
passed through silently. I've created an issue for it:
https://github.com/openbmc/sdbusplus/issues/38 .

In manpage for sd_bus_add_match() there is no helpful information about
possible reasons for this over the limit case. I'm trying to figure it out from
systemd code, with little success so far.

SD_BUS_ERROR_LIMITS_EXCEEDED
  Some limited resource has been exhausted.

Maybe anybody knows what and where the limit is and where we can tweak it?
As far as I can see, there are only ulimit settings In systemd's system.conf.

Thanks.

