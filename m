Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D44A136213F
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 15:42:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMHSV68pdz3bxM
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 23:42:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=aYUBu8Bj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=aYUBu8Bj; dkim-atps=neutral
X-Greylist: delayed 432 seconds by postgrey-1.36 at boromir;
 Fri, 16 Apr 2021 23:41:50 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMHSG0rldz30DL
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 23:41:49 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 54B43413B7;
 Fri, 16 Apr 2021 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1618580072; x=1620394473; bh=xRw/hmtRV1YGf9PaeG62WA29P
 GLxSTVcBNQy/tco5DY=; b=aYUBu8Bjb/yqBNSQ2u9IjmRqFZ1KDiu2EcoY+jUfF
 e2Qy6qX/6h40wK1nwdZW+lh8nN/i+JbXssT3xzMxG2ArwT14+WhhXGZc133XWBhj
 d8pMBx77jFVQ5qGv2pWtlVRzigLaaceIu4EEF3f2zfNMiqZsmv8yKQbrEArSxXKh
 78=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITRGrvA-gWQg; Fri, 16 Apr 2021 16:34:32 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8AA11413A7;
 Fri, 16 Apr 2021 16:34:30 +0300 (MSK)
Received: from localhost.localdomain (10.199.0.148) by
 T-EXCH-03.corp.yadro.com (172.17.100.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 16 Apr 2021 16:34:29 +0300
Message-ID: <23266ce6bbff6023ee2d04b2df572dd366ef2bdc.camel@yadro.com>
Subject: Re: ClientOriginIPAddress is 0.0.0.0 or ""
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Ed Tanous <ed@tanous.net>, Sunitha Harish <sunithaharish04@gmail.com>
Date: Fri, 16 Apr 2021 16:42:38 +0300
In-Reply-To: <CACWQX82sqaoP8aeWxrZZFS_G62wVebBHidpuzfA21Kd4t4BxUQ@mail.gmail.com>
References: <HK0PR04MB3346AD905ABEB1250F51E202B1969@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <HK0PR04MB3346A7C9EA60289912747398B1699@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <CACWQX81k7NO-+8OyPhAbk9BNfB58xuK13RvHhG4m-G+nDHPniA@mail.gmail.com>
 <d9176b8e-1944-e654-baea-81064f195d35@gmail.com>
 <CACWQX82sqaoP8aeWxrZZFS_G62wVebBHidpuzfA21Kd4t4BxUQ@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.148]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: Jun-Lin Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E9=9C=96=29?=
 <Jun-Lin.Chen@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2021-04-09 at 07:58 -0700, Ed Tanous wrote:
> On Thu, Apr 8, 2021 at 10:51 PM Sunitha Harish
> <sunithaharish04@gmail.com> wrote:
> > 
> > On 06-04-2021 22:21, Ed Tanous wrote:
> > > On Tue, Mar 23, 2021 at 3:28 PM Jun-Lin Chen (陳俊霖)
> > > <Jun-Lin.Chen@quantatw.com> wrote:
> > > > Hi,
> > > > 
> > > > If continously send POST sessions Redfish request via Postman. I observe
> > > > bmcweb debug logs, it will established connection at first request then
> > > > not fetch user ip after the second request.
> > > > 
> > > > 
> > > > 
> > > > That's why ClientOriginIPAddress in session after the second created is
> > > > always 0.0.0.0 (not be assigned).
> > > > 
> > > > 
> > > > 
> > > > In HTTP 1.1 It uses keep-alive Header default. so BMC does not fetch
> > > > user IP when its connection is established.
> > > > 
> > > > 
> > > > 
> > > > Is this behavior we expect?
> > > > 
> > > > 
> > > > 
> > > > Best regards,
> > > > 
> > > > Jun-Lin Chen
> > > 
> > > Sunitha,
> > > Considering this is code you wrote, would you mind replying to Jun-Lin
> > > about his experience and what the expected behavior is?  For what it's
> > > worth, I've seen it report 0.0.0.0 before on my system, I just haven't
> > > had a chance to chase it down and debug it.
> > > 
> > > -Ed
> > 
> > Hi Jun-Lin,
> > 
> > The ClientOriginIPAddress is expected to get populated when the session
> > is established to the BMC ( the first request). This is a one time
> > fetch, and it will be persisted for that session.
> 
> Can you think of a reason it would report all zeros?  Can you verify
> this functionality works properly on your system?
> Part of me wonders if this has something to do with http keepalive.
> 
> > Regards,
> > Sunitha
> > > > 
> > > > From: Jun-Lin Chen (陳俊霖)
> > > > Sent: Friday, March 5, 2021 4:05 PM
> > > > To: sunharis@in.ibm.com
> > > > Cc: openbmc@lists.ozlabs.org
> > > > Subject: ClientOriginIPAddress is 0.0.0.0 or ""
> > > > 
> > > > 
> > > > 
> > > > Hi Sunitha,
> > > > 
> > > > 
> > > > 
> > > > I found some problem when I create session.
> > > > 
> > > > The property “ClientOriginIPAddress” is “” after POST
> > > > https://${bmc}/login -d '{"username": <>,"password": <>}
> > > > 
> > > > And it is 0.0.0.0 after POST
> > > > https://${bmc}/redfish/v1/SessionService/Sessions -d '{"username":
> > > > <>,"password": <>}'
> > > > 
> > > > Both of them looked like something wrong. And I also look for source
> > > > code in bmcweb repository.
> > > > 
> > > > There only defined the default value: “” in generateUserSession() and
> > > > not found fetch user ip in elsewhere.
> > > > 
> > > > I think it is why ClientOriginIPAddress is strange.
> > > > 
> > > > 
> > > > 
> > > > May I ask what step or something I lack in creation session so this
> > > > property is abnormal?
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > Best regards,
> > > > 
> > > > Jun-Lin Chen
> > > > 
> > > > 

Hello Ed, I made some research at this point, ipAddress always sets to 0.0.0.0
after first Request, it is done by req.emplace(parser->get()) in doWrite
function in http/http_connection.h. fetchClientIp sets ipAddress only on
connection start. It is possible to fix it with additional fetchClientIp inside
handle function which seems overhead or

ipAddress = req->ipAddress;
req.emplace(parser->get());
req->ipAddress = ipAddress;

I don't like both variants but possible that ipAddress shouldn't be a part of
Request struct.

Any ideas?

