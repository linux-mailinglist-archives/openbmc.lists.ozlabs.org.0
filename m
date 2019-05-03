Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E8813666
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2019 01:57:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wpwc3qT9zDqYt
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2019 09:57:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wpvn1PcWzDqVc
 for <openbmc@lists.ozlabs.org>; Sat,  4 May 2019 09:57:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 16:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="145866505"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.255.84.179])
 ([10.255.84.179])
 by fmsmga008.fm.intel.com with ESMTP; 03 May 2019 16:57:04 -0700
Subject: Re: A question about phosphor-sel-logger
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
References: <f68b269b1a854bfabfb021c1ae1955cc@quantatw.com>
 <04fa16ca-4f2a-0f2d-e6ef-8118fd757b0e@linux.intel.com>
 <2b26e8a78f5548bc9d68349e5323b861@quantatw.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <bcd254dd-cbc6-abb0-f618-265d8644df43@linux.intel.com>
Date: Fri, 3 May 2019 16:57:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2b26e8a78f5548bc9d68349e5323b861@quantatw.com>
Content-Type: text/plain; charset=big5; format=flowed
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 5/2/2019 8:39 PM, Will Liang (±ç¥Ã¹b) wrote:
> Hi Jason,
> 
> I am very thankful that you reply me quickly and it's great to hear that you are working on this issue.
> If you can share your rsyslog configuration with me that will be a good news for me, I can trace it first.
I will share my rsyslog configuration file below.  It requires the 
imjournal module to be installed which can be done by adding 
'PACKAGECONFIG_append = " imjournal"' to an rsyslog_%.bbappend file.

> 
> According to the above URL, is it something I missed, I did not find the "add sel" to sys log function?

If the imjournal rsyslog module works well enough, then the "add sel" 
function won't need to change.  SEL entries will still be added to the 
journal and the imjournal module will read the journal to find new SEL 
entries for rsyslog to save to the SEL log file.

> I wander to know how you add sel to sys log. Or you want to share it after internal testing.
> 
I'm willing to share whatever you are interested in, but it may change 
if internal testing finds issues.  I'm planning to push the entire 
solution once we complete initial internal testing.

For clearing the log to work, you need to add "Reload" support to the 
rsyslog service file.  I do this by adding this line to an override 
.conf file:
ExecReload=/bin/kill -HUP $MAINPID

Here is my rsyslog.conf file which configures the entries the imjournal 
module is looking for and how to format them in the syslog files:
# if you experience problems, check
# http://www.rsyslog.com/troubleshoot for assistance

# rsyslog v3: load input modules
# If you do not load inputs, nothing happens!
# You may need to set the module load path if modules are not found.
#
# Ported from debian's sysklogd.conf

# Journal-style logging
# Limit to no more than 2000 entries in one minute and enable the
# journal workaround to avoid duplicate entries
module(load="imjournal" StateFile="/var/log/state"
                         RateLimit.Interval="60"
                         RateLimit.Burst="2000"
                         WorkAroundJournalBug="on")

# Template for IPMI SEL messages
# "<timestamp> <ID>,<Type>,<EventData>,[<Generator ID>,<Path>,<Direction>]"
template(name="IPMISELTemplate" type="list") {
     property(name="timereported" dateFormat="rfc3339")
     constant(value=" ")
     property(name="$!IPMI_SEL_RECORD_ID")
     constant(value=",")
     property(name="$!IPMI_SEL_RECORD_TYPE")
     constant(value=",")
     property(name="$!IPMI_SEL_DATA")
     constant(value=",")
     property(name="$!IPMI_SEL_GENERATOR_ID")
     constant(value=",")
     property(name="$!IPMI_SEL_SENSOR_PATH")
     constant(value=",")
     property(name="$!IPMI_SEL_EVENT_DIR")
     constant(value="\n")
}

# Template for Redfish messages
# "<timestamp> <MessageId>,<MessageArgs>"
template(name="RedfishTemplate" type="list") {
     property(name="timereported" dateFormat="rfc3339")
     constant(value=" ")
     property(name="$!REDFISH_MESSAGE_ID")
     constant(value=",")
     property(name="$!REDFISH_MESSAGE_ARGS")
     constant(value="\n")
}

# If the journal entry has the IPMI SEL MESSAGE_ID, save as IPMI SEL
if ($!MESSAGE_ID == "b370836ccf2f4850ac5bee185b77893a") then {
    action(type="omfile" file="/var/log/ipmi_sel" 
template="IPMISELTemplate")
}

# If the journal entry has a Redfish MessageId, save as a Redfish event
if ($!REDFISH_MESSAGE_ID != "") then {
    action(type="omfile" file="/var/log/redfish" template="RedfishTemplate")
}

#
# Include all config files in /etc/rsyslog.d/
#
$IncludeConfig /etc/rsyslog.d/*.conf
