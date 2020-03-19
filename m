Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C644D18BB11
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 16:26:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jrNj0Ll5zDrP9
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 02:26:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=yadro.com (client-ip=89.207.88.252;
 helo=mta-01.yadro.com; envelope-from=i.mikhaylov@yadro.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Idi/ojJ1; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jr6b6qx2zDr5J
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 02:14:31 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 97FE3412DB;
 Thu, 19 Mar 2020 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1584630860; x=1586445261; bh=f1fHyy9NctbZxLScYIwJP+2tH
 /VskQd1877Y+M1/bi0=; b=Idi/ojJ1EmobSel6gxG3NXE6rOQCw0l2hLFQhBTRi
 O511NYEom1iscZMeMzaSZUuIDvJ3ylAwmaFgs5m7EG5e96Zd0qXPcbOcE7HM3a2z
 DZXil6dOuQidwa9cBtpXIZ6qz0RVM6GUqNlX8mHjnSZ2F07t6akNnaMJKLl1aSVs
 4M=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dt8CyksNtFvS; Thu, 19 Mar 2020 18:14:20 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D36B7412E3;
 Thu, 19 Mar 2020 18:14:19 +0300 (MSK)
Received: from localhost.localdomain (10.199.1.78) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 19
 Mar 2020 18:14:20 +0300
Message-ID: <3672a09d41f6d80fcff8f85306eda4ef07351a34.camel@yadro.com>
Subject: Re: service for tracking user activity (phosphor-audit)
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Geissler
 <geissonator@gmail.com>
Date: Thu, 19 Mar 2020 18:14:09 +0300
In-Reply-To: <07C231EA-1761-4014-9A78-E2BDA3D71F0E@fuzziesquirrel.com>
References: <4efbcd540d3dd4bfb8021bdb6864326f72092852.camel@yadro.com>
 <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
 <B9364499-3954-4862-BDF2-52467AF39327@gmail.com>
 <07C231EA-1761-4014-9A78-E2BDA3D71F0E@fuzziesquirrel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.1.78]
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
Cc: gmills@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-17 at 16:08 -0400, Brad Bishop wrote:
> at 2:46 PM, Andrew Geissler <geissonator@gmail.com> wrote:
> 
> > Matt and Deepak could weigh in on whether this could be a part of
> > phosphor-logging.
> 
> This would be my preference.
> 
> thx - Brad

Who can grant me rights into this rep or to directory in it? Matt, Deepak? Also,
phosphor-logging/phosphor-audit would be the possible place for it then.

Thanks.

