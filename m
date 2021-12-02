Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0246686D
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 17:34:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4hP40QrCz2yqC
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 03:34:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=Y5Fwh3Gr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Y5Fwh3Gr; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4hNg6PDDz2yQH
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 03:33:55 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 414384380C
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1638462830;
 x=1640277231; bh=RRCLdSX+7586EC3MsCSO6bxvvCwgP5Ub9FSyocgMH90=; b=
 Y5Fwh3GrRdln6reCn3coK6piVOvPF8jagAx7zIoaSEEsnq4RGpUhcvdZgaO3o7i3
 ZQp8+6tcvtudQoSExoWwHwLV2zsMh8CZuzetYWWbn1xrIKkCMpWkmA4zx8tQ/Xgn
 gvop8aIkZee2GY93Nohk0bHl6BqUZj50zrDNxE4ROnY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLOvXCS0WISH for <openbmc@lists.ozlabs.org>;
 Thu,  2 Dec 2021 19:33:50 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E1ACB4380A
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 19:33:50 +0300 (MSK)
Received: from localhost (172.17.1.114) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 2 Dec
 2021 19:33:50 +0300
Date: Thu, 2 Dec 2021 19:33:50 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Is BBLAYERS_NON_REMOVABLE obsolette?
Message-ID: <Yaj0bPk3yiw/9y8F@nbwork.lan>
References: <bf3a0a05af8f4307ad487f29e0c19da3@yadro.com>
 <YajoGODkG52luR0T@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YajoGODkG52luR0T@heinlein>
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

On Thu, Dec 02, 2021 at 09:36:56AM -0600, Patrick Williams wrote:
> 
> Yes, please go ahead and remove across the meta-layers.  As you said I don't see
> any occurrence of "NON_REMOVABLE" outside of our layers:
> 

Done.

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49261

--
Alexander
