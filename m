Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4118BB96
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 16:50:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jrvw4j2NzDrNg
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 02:50:20 +1100 (AEDT)
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
 header.s=mta-01 header.b=jeDtDFFE; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jrtW1CCzzDrNf
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 02:49:07 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4D820412E0;
 Thu, 19 Mar 2020 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1584632942; x=1586447343; bh=rBfJIH6/UjFhHXxtoKL7aoEwR
 ay/vJsF2S8j3OpyMgk=; b=jeDtDFFEOKMxQz755oimwDQqyjpVEsWpow+XPoR54
 w4nDGz8ou1RJupd8gKS0AtXTKivmp5sW82NZPtRiXOl8ZToMsjnEmdMgnihhvBo1
 h8PjEK3WC0P8MSN3yY+cxuoAAjEix7qgwml6cCPGl/azKJvHfhyBoqrOZCKjv2gx
 mA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfD8MCMGbTaT; Thu, 19 Mar 2020 18:49:02 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 04A43412DB;
 Thu, 19 Mar 2020 18:49:01 +0300 (MSK)
Received: from localhost.localdomain (10.199.1.78) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 19
 Mar 2020 18:49:02 +0300
Message-ID: <4bdeb03083a0b1e9141118d1d47a3ca0ba2e1b96.camel@yadro.com>
Subject: Re: Proposal for the connected redfish client info
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Richard Hanley <rhanley@google.com>
Date: Thu, 19 Mar 2020 18:49:03 +0300
In-Reply-To: <CAH1kD+aJVELPFNR=F-rL3Bkp8pv8=yO+aRJOJFWEFEi_awgKNA@mail.gmail.com>
References: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
 <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
 <530d856cf60f594e39a81e5b8b6f12253d0f3544.camel@yadro.com>
 <CAH1kD+aJVELPFNR=F-rL3Bkp8pv8=yO+aRJOJFWEFEi_awgKNA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-17 at 12:49 -0700, Richard Hanley wrote:
> >Show the connected redfish client info.
> > ClientIP
> > Client Unique Identifier(unique serial number of the client etc)
> 
> I'd like to know a bit more of the use case for this information.  Is this
> done to help clients find each other in realtime? Or is this being to log
> accesses for security audits?  I think that would help me figure out what
> direction we should move towards.
> 
> If this is related to auditing, then we should be thinking about how this
> feature might expand over time.
> 

Not sure about Ratan's use case but ClientIP will be used in upcoming phosphor-
audit work.

