Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2838E1B7C5D
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 19:07:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4980vn3T05zDqNs
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 03:07:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=wiktor.golgowski@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4980r01rSSzDqZn
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 03:03:34 +1000 (AEST)
IronPort-SDR: smbHbqctJDp9EmPoozR0fl1qmmJFlVHbXMkEyqsyOeFfRr8T9FxT7SbaYNzHk4m6O6pI3UU865
 VAP3CAgMhAXQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 10:03:31 -0700
IronPort-SDR: JPMxAU6U+i9pI8UJG9WYRV69eWAzadjN1JjY3jNh/EALXdTjoYliXMYoBCbJIhOxbm9sEl3eJ4
 3uKdL02WQxQQ==
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="430840733"
Received: from gklab-127-200.igk.intel.com (HELO [10.91.127.200])
 ([10.91.127.200])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 10:03:29 -0700
Subject: Re: mTLS on bmcweb
To: Richard Hanley <rhanley@google.com>, Zhenfei Tai <ztai@google.com>
References: <mailman.1237.1587601186.5884.openbmc@lists.ozlabs.org>
 <1DF7E55B-29E9-43A2-9981-F67521B2B3E2@quantatw.com>
 <c34fc105-657d-1e33-e3fc-90cb5afba75a@linux.ibm.com>
 <CAMXw96NDQ7CrY_pTZH+NugOD_6Z0HiKw1dO4vKkpaiRauFgVyQ@mail.gmail.com>
 <CAH1kD+YFYom+qJLBV4rvX6=j2vZSty0GNYw=MGQNG0P60b8h7Q@mail.gmail.com>
From: =?UTF-8?Q?Wiktor_Go=c5=82gowski?= <wiktor.golgowski@linux.intel.com>
Message-ID: <1251a083-2d63-aa7e-32f4-cf876dde8e4e@linux.intel.com>
Date: Fri, 24 Apr 2020 19:03:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAH1kD+YFYom+qJLBV4rvX6=j2vZSty0GNYw=MGQNG0P60b8h7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/23/20 7:35 PM, Richard Hanley wrote:
> My guess is that somehow the root cert used to validate clients isn't installed correctly, and so it's defaulting to basic auth.
> 
> At least that's my reading of this review https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27270
> 

I think this would be the case. If the client certificate is not provided, TLS connection is 
still established, just without authenticating the client. This allows upper layer to provide
other authentication methods (e.g. Basic Auth).
>  
> On Thu, Apr 23, 2020 at 9:47 AM Zhenfei Tai <ztai@google.com <mailto:ztai@google.com>> wrote:
> 
>     I guess part of my question is how to configure the mTLS certs to make it work properly.
> 
>     So far only https works (server side TLS).
> 
>     Thanks,
>     Zhenfei
> 
>     On Thu, Apr 23, 2020 at 8:50 AM Joseph Reynolds <jrey@linux.ibm.com <mailto:jrey@linux.ibm.com>> wrote:
> 
>         On 4/23/20 5:47 AM, P. K. Lee (李柏寬) wrote:
>         > Hi,
>         >
>         > I encountered the same issue when using Redfish to replace the certificate.
>         > Regardless of whether the parameters include --cert --key --cacert or only --cacert, the authentication can still succeed.
>         >
>         > Best,
>         > P.K.
>         >
>         >> Date: Wed, 22 Apr 2020 14:58:06 -0700
>         >> From: Zhenfei Tai <ztai@google.com <mailto:ztai@google.com>>
>         >> To: openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>         >> Subject: mTLS on bmcweb
>         >> Message-ID:
>         >>      <CAMXw96Pp511sUO=q1XLz2uJzh4S6D7tUwmkvpbnq_yU-iJfiKg@mail.g
>         >> mail.com <http://mail.com>>
>         >> Content-Type: text/plain; charset="utf-8"
>         >>
>         >> Hi,
>         >>
>         >> I'm trying out bmcweb mTLS which should be enabled by default by
>         >> https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L89
>         >>
>         >> In my test, I created a self signed key and certificate pair, stacked them
>         >> up into server.pem in /etc/ssl/certs/https that bmcweb uses.
>         >>
>         >> However when I tried to curl bmcweb service, I was able to get response by
>         >> only supplying the cert.
>         >>
>         >> curl --cacert cert.pem  https://${bmc}/redfish/v1
>         >>
>         >> With the mTLS enabled, I expected it should error out since no client
>         >> certificate is provided.
>         >>

As mentioned, if you did not provide a client certificate, connection was established to
allow for Basic Auth. And as the Service Root requires no authentication, you got
a response.

- Wiktor

>         >> Could someone with relevant knowledge help with my question?
> 
>         I'm not sure what you are asking.  Are you asking how to install mTLS
>         certs into the BMC and then use them to connect?  I am still waiting for
>         documentation that describes how to configure and use the mTLS feature.
> 
>         I've added an entry to the security working group as a reminder to do
>         this.  (I don't have the skill to document this feature.)
> 
>         - Joseph
> 
>         >>
>         >> Thanks,
>         >> Zhenfei
> 
