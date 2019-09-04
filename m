Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342AA77E8
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 02:43:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NQ6F6BVdzDqg6
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 10:43:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NQ5c6P78zDqcQ
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 10:42:44 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 17:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="194529899"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.254.64.140])
 ([10.254.64.140])
 by orsmga002.jf.intel.com with ESMTP; 03 Sep 2019 17:42:41 -0700
Subject: Re: Question of pid-contorl on stepwise configuration
To: Derek Lin23 <dlin23@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <a495e5b8d85441bbaefdba85979e333e@lenovo.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <937f7c61-0a97-2857-e449-bd6bab7e5ef1@linux.intel.com>
Date: Tue, 3 Sep 2019 17:42:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a495e5b8d85441bbaefdba85979e333e@lenovo.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/21/2019 4:36 AM, Derek Lin23 wrote:
> Hi team:
> 
>            I have a question regarding stepwise configuration on 
> pid-control.
> 
>            I have mine setup like below.
> 
>                                         {
> 
>                      "name": "Ambient_Temp",
> 
>                      "type": "stepwise",
> 
>                      "setpoint": 0.0,
> 
>                      "inputs": ["Ambient_Temp"],
> 
>                      "pid": {
> 
>                          "samplePeriod": 1.0,
> 
>                          "positiveHysteresis": 0.0,
> 
>                          "negativeHysteresis": 0.0,
> 
>                          "isCeiling": false,
> 
>                          "reading": {
> 
>                              "0": 25,
> 
>                              "1": 30,
> 
>                              "2": 35
> 
>                          },
> 
>                          "output": {
> 
>                              "0": 15,
> 
>                              "1": 15,
> 
>                              "2": 15
> 
>                         }
> 
>                      }
> 
>                  }
> 

I don't use the json configuration, so you'll have to do a bit of a 
comparison of apples and oranges, but here is an example of a stepwise 
configuration: 
https://github.com/openbmc/entity-manager/blob/08a5b175eec81c53506709fda8a7c168748cc22d/configurations/R1000%20Chassis.json#L577

Reading is the reading of the sensor, and output is the setpoint given 
to the fan pid. Depending on how you configure your system this can 
either be a percent, or it can be a tach reading. When a sensor reaches 
a reading, the corresponding output is given to the fan controller as a 
setpoint. So it my example, when we reach a temp of 30 degrees, the 
setpoint of 60 is given to the fancontroller. This 60 is unitless and 
depends on how the fan controller configuration is implemented how it 
affects the fans.

-James

>            And, I would like to know the meaning of each field, as far 
> as I understand from phosphor-pid-control, “setpoint” seems not used if 
> PID type is stepwise. Is that true? The “reading” field indicates the 
> temperature reading from the sensor “Ambient”. The “output” field should 
> indicate the duty % corresponding to the fans, or should output be RPMs? 
> That gives me when a reading of 25 degree(whatever the unit is), the 
> output duty of fans should set to 15%, or set to corresponding RPMs.
> 
> Do I understand the fields correctly?
> 
> Thank you,
> 
> ------------------------------------------------------------------------
> 
> *Derek Lin*
> Sr. BMC Engineer
> 8F,66, San Chong Rd., Nankang Software Park, Taipei.
> Lenovo Taiwan
> 
> 	
> 
> Phone+886281707411
> Emaildlin23@lenovo.com <mailto:dlin23@lenovo.com>
> 
> 	
> 
> Lenovo.com <http://www.lenovo.com/>
> Twitter <http://twitter.com/lenovo> | Instagram 
> <https://instagram.com/lenovo> | Facebook 
> <http://www.facebook.com/lenovo> | Linkedin 
> <http://www.linkedin.com/company/lenovo> | YouTube 
> <http://www.youtube.com/lenovovision> | Privacy 
> <https://www.lenovo.com/gb/en/privacy-selector/>
> 
> 	
> 
> ImageLogo-DCG-Honeycomb
> 
> 	
> 
