Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC72C188CB1
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 19:00:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hgtS3VztzDqmq
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 05:00:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=oKiNnIDi; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hgsS5vxszDqlB
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 04:59:08 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4F1DB4128F;
 Tue, 17 Mar 2020 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1584467942; x=1586282343; bh=XUl7RT0uBDpOF0/mnGHNCap0E
 ec/EWsHV+5Ik6bDg5w=; b=oKiNnIDiAFUIsY2/e1f2qknDCdXEQmUshJyku3TS+
 Kh8pb7nURYnu7tYE55Gx/VQmYpMkzL/vB7MZxHP5uLqetX5RVYKnSOvtmqVsxllV
 Syn6bxUNyLjO1mVcsN44OCjOGBlAbY9qXt/PoyJN/SVOEfyXT5a/PBcQ9fj5ly5h
 4o=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hadhq4JGGnXo; Tue, 17 Mar 2020 20:59:02 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 646CC4128E;
 Tue, 17 Mar 2020 20:59:01 +0300 (MSK)
Received: from localhost.localdomain (10.199.3.54) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 17
 Mar 2020 20:59:01 +0300
Message-ID: <530d856cf60f594e39a81e5b8b6f12253d0f3544.camel@yadro.com>
Subject: Re: Proposal for the connected redfish client info
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, <openbmc@lists.ozlabs.org>,
 <james.feist@linux.intel.com>
Date: Tue, 17 Mar 2020 20:58:44 +0300
In-Reply-To: <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
References: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
 <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.3.54]
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

On Tue, 2020-03-17 at 18:31 +0530, Ratan Gupta wrote:
> Hi Team,
> 
> Looking for your inputs 
> 
> James, How about option1 for the below use case
> 
> Ratan
> 
> On 3/11/20 3:48 PM, Ratan Gupta wrote:
> > Hi Team,
> > 
> > In IBM we have a following requirement
> > 
> > Show the connected redfish client info.
> >   ClientIP
> >   Client Unique Identifier(unique serial number of the client etc)
> > 
> > Presently there is no way through which we can get this info.
> > 
> > I have following two proposal for the above requirement.
> > 
> > 1/ (Extend the session schema)
> > 
> > Add the IPaddress and the client Identifier as a OEM in the session schema,
> > Clinet IP would be read only and will be updated once the redfish client
> > creates the session.

We've already some sort of it in our local env for old builds. I don't mind
about client ip read only property inside session/connection inside bmcweb. 

> > ClientIdentifier(Management console unique serial number etc) will be
> > writable property and can be set by the redfish client 
> > during creation of the session or after creating the session.

What is 'ClientIdentifier' and why it should be there?

