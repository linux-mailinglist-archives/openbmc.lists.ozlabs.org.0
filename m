Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1586734D
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 18:32:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ldjv5k14zDr0f
	for <lists+openbmc@lfdr.de>; Sat, 13 Jul 2019 02:32:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="OM55ds5t"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ldjF5xdHzDqxf
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jul 2019 02:31:29 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 35B2741908;
 Fri, 12 Jul 2019 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1562949083; x=1564763484; bh=FvBJ+4/iJBISz5WxapOSpcJnw
 id7GnIFOrsTJK6it2Y=; b=OM55ds5t4DwxK5DGg1gDTIuW6foDxdJTqYr+V8sQk
 jNC1v9XXvmv4UfSrqw43pURqni3s7t0tNZUPjkbuPWYUuHx8e9+xnYiMxYr3B1n8
 zTnC5cYDMv4BFLA3XZeZuc8h3XzKth41ALTqb5GroQeqNmNAxil+RgcwpKfCFFVu
 oo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAFVbEpb0rls; Fri, 12 Jul 2019 19:31:23 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AAEBE418A4;
 Fri, 12 Jul 2019 19:31:22 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 12 Jul 2019 19:31:22 +0300
Message-ID: <dff630eeff6a8b62ada2732d180b20e1d1bb45e8.camel@yadro.com>
Subject: Re: fsi/sbefifo problems on bmc
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Eddie James
 <eajames@linux.vnet.ibm.com>, <cbostic@linux.vnet.ibm.com>
Date: Fri, 12 Jul 2019 19:30:46 +0300
In-Reply-To: <d3479235b652ed35303af785db4751bbe0caed06.camel@yadro.com>
References: <ce4ba08f8d44c5e3d1f8a549578ce23c2311f39d.camel@yadro.com>
 <e76b6c0d-f822-18f3-a5f6-6e69e50ec390@linux.vnet.ibm.com>
 <e5f536d8ceb6017aab17773f3eed2e10b1f687b9.camel@kernel.crashing.org>
 <d3479235b652ed35303af785db4751bbe0caed06.camel@yadro.com>
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
Cc: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We found out what's wrong with our board, we had the issue with cpld fsi reset
signal line which resulted in such behaviour after poweroff. After the cpld
firmware fix problem is gone.

