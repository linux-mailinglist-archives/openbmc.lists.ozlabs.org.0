Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF98173E34
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 18:18:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Tbpg47qFzDrMf
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 04:18:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=gYGtUSVs; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Tbp16931zDrMJ
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 04:17:42 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 582F341364;
 Fri, 28 Feb 2020 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1582910254; x=1584724655; bh=0BQq5C08CoODoJFib1ipiDdXI
 GDSDzHkfdwxNMCaCmY=; b=gYGtUSVsAbTSXpBYILUVWXTO6ephFCQzYPeXlHudf
 Nwtu/XYdiQBF5P4N95QfGQ4N7QuAMQ4swUQ2OyjU9gzC8QzAk5xUlS4RPC5XIN+O
 xd7Xw4WpM4vyTExCvUIvS33nOtPO6QVDdMZh3nYIUuxR/9Dy2fMSCnBw5YoSV5Pp
 mg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7op_qdmV5qi; Fri, 28 Feb 2020 20:17:34 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DF43A41369;
 Fri, 28 Feb 2020 20:17:30 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 28 Feb 2020 20:17:30 +0300
Message-ID: <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
Subject: Re: service for tracking user activity (phosphor-audit)
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Fri, 28 Feb 2020 20:15:05 +0300
In-Reply-To: <4efbcd540d3dd4bfb8021bdb6864326f72092852.camel@yadro.com>
References: <4efbcd540d3dd4bfb8021bdb6864326f72092852.camel@yadro.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-01.corp.yadro.com (172.17.10.101)
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
Cc: gmills@us.ibm.com, geissonator@yahoo.com, joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2019-08-26 at 15:31 +0300, Ivan Mikhaylov wrote:
> hi all, There it is updated design proposal about audit service which provides
> a
> way to track user activity. Right now most parts are described there. If you
> have any ideas or anything to add, feel free to share in this thread.
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23870
> 
> 
> thanks.
> 

Thank you, everyone involved in the review process of this document! Just got
back from the leave, and wanted to ask who should create the rep or which rep
part it should belong to? I want to use the meson build system for this project,
any problems with this decision? Also, any other tips or suggestions are
welcome. I'll start working on it in next 1-2 weeks.

Thanks.

