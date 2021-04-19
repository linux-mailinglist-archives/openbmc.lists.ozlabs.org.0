Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1380363A9D
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 06:41:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNvKB5ykvz3bnd
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 14:41:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=yugang.chen@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNvK06HcTz301q
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 14:41:07 +1000 (AEST)
IronPort-SDR: 4wZWGXWWXOr7b4OEwNJP7vZKfY+ZVNOM8fdnJyMS/6P/9etYUtEFR8QHWGDw5MqtX2ehdILRpE
 HKLYEXbaiBlQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="182760830"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
 d="md'?scan'208";a="182760830"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 21:41:03 -0700
IronPort-SDR: ph7XRjIM6ohoxYeiZUBYOGyjYpII0DEskNey2wWE9hpD8iRedA8pFlgK6QArjncUb8Vmy6JCl5
 F+qYN2BqdB5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
 d="md'?scan'208";a="613277074"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 18 Apr 2021 21:41:02 -0700
Received: from [10.238.5.192] (yugangch-MOBL.ccr.corp.intel.com [10.238.5.192])
 by linux.intel.com (Postfix) with ESMTP id ADB1058087B;
 Sun, 18 Apr 2021 21:41:01 -0700 (PDT)
Subject: Re: apply for a new repo "openbmc/node-data-sync"
To: Ed Tanous <edtanous@google.com>
References: <cab2988f-76b8-6a30-5fa9-0ee8030af7f0@linux.intel.com>
 <AF9887DB-F6CB-4CE0-90B1-17FEA2497013@fuzziesquirrel.com>
 <bd64513a-76f6-7617-9942-ced892b2c500@linux.intel.com>
 <CAH2-KxAe7v2ptH5SEJkd5YeQ-nCo_JQvwCoS5nU=ZLFac+tAuw@mail.gmail.com>
From: "yugang.chen" <yugang.chen@linux.intel.com>
Message-ID: <2e6ff1b9-733b-56ca-5cd6-fab6f0b20530@linux.intel.com>
Date: Mon, 19 Apr 2021 12:41:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAH2-KxAe7v2ptH5SEJkd5YeQ-nCo_JQvwCoS5nU=ZLFac+tAuw@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------8FFBD235595E2F08A7FBA6DD"
Content-Language: en-US
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, chunhui.jia@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------8FFBD235595E2F08A7FBA6DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

attach the design document, please take a look.

Best Regards
Daniel(Yugang)

On 4/13/2021 3:26 AM, Ed Tanous wrote:
> On Sun, Apr 11, 2021 at 11:40 PM yugang.chen
> <yugang.chen@linux.intel.com> wrote:
>> thanks, Brad.
>>
>> + openbmc@lists.ozlabs.org .
>>
>> Dear All,
>>
>> I'm Intel BMC engineer, we have a module is used to sync sensor data between BMC nodes in one Chassis system. In our Modular system, there are 2 nodes or 4 nodes, one node works as Primary node, the other nodes work as secondary nodes.
>>
>> 1. Some sensors are only visible for primary BMC, but secondary nodes need the sensors for Fan control.
>>
>> 2. Some sensor are in secondary nodes, they are needed to show them on primary node.
>>
>> So, we need a new repo to sync the sensor data between primary node and secondary nodes, could you create a repo "openbmc/node-data-sync"? thanks.
>>
> +1 to wanting a design document for this.  In absence of that, I'm
> going to make the possibly wrong assumption that you're planning on
> using IPMB.  In dbus-sensors, we already have IPMB Sensor syncing, and
> patches are in progress to add IPMB version remoting.  You might want
> to look into those to see if they meet your needs, or can be amended
> to meet your needs before trying to push a new project.
>
>> Best Regards
>>
>> Daniel(Yugang)
>>
>>
>> On 4/10/2021 10:55 PM, Brad Bishop wrote:
>>> Hi Daniel
>>>
>>> Can you please send this to the mailing list so everyone can be aware of the work you are doing?
>>>
>>> thanks - brad
>>>
>>>> On Apr 7, 2021, at 1:31 AM, yugang.chen <yugang.chen@linux.intel.com> wrote:
>>>>
>>>> Hi Brad,
>>>>
>>>> I'm Intel BMC engineer, we have a module is used to sync sensor data between BMC nodes in one Chassis system. In our Modular system, there are 2 nodes or 4 nodes, one node works as Primary node, the other nodes work as secondary nodes.
>>>>
>>>> 1. Some sensors are only visible for primary BMC, but secondary nodes need the sensors for Fan control.
>>>>
>>>> 2. Some sensor are in secondary nodes, they are needed to show them on primary node.
>>>>
>>>> So, we need a new repo to sync the sensor data between primary node and secondary nodes, could you create a repo "openbmc/node-data-sync"? thanks.
>>>>
>>>>
>>>> Best Regards
>>>>
>>>> Daniel(Yugang)
>>>>

--------------8FFBD235595E2F08A7FBA6DD
Content-Type: text/plain; charset=UTF-8;
 name="node-data-sync.md"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="node-data-sync.md"

IyBNb2R1bGFyIFN5c3RlbSBTdXBwb3J0IC0gUENIIElPIEV4cGFuZGVyDQoNCkF1dGhvcjog
Q2hlbiwgWXVnYW5nDQoNCiMjIFByb2JsZW0gRGVzY3JpcHRpb24NCldoZW4gbXVsdGkgbW9k
dWxhciAyIHNvY2tldCByZWZlcmVuY2UgcGxhdGZvcm1zIChSUCkgYXJlIGNvbm5lY3RlZCB0
b2dldGhlciwNCnRoZSBCTUNzIG9uIGVhY2ggUlAgc2hhbGwgc3VwcG9ydCB0aGUgYWJpbGl0
eSB0byBtYW5hZ2UgdGhlIHN5c3RlbSBhcyBlaXRoZXINCnNpbmdsZSA0Uy84UyBzeXN0ZW0g
b3Igc3RhbmRhbG9uZSBhcyAyUyBzeXN0ZW1zLg0KDQojIyBCYWNrZ3JvdW5kIGFuZCBSZWZl
cmVuY2VzDQpJbiA0Uy84UyBtb2RlLCBvbmx5IG9uZSBQQ0ggd29ya3MgYXQgRE1JIChEaXJl
Y3QgTWVkaWEgSW50ZXJmYWNlKSBtb2RlLA0KdGhpcyBQQ0ggaXMgY2FsbGVkIGxlZ2FjeSBQ
Q0ggKFBDSC5MKSwgdGhlIG90aGVyIFBDSHMgYXJlIGNhbGxlZCBQQ0ggSU8gRXhwYW5kZXIN
CihQQ0guSU8pLiBUaGUgQk1DIGF0dGFjaGVkIHRvIHRoZSBQQ0guTCB3b3JrcyBhcyBhIHBy
aW1hcnkgYW5kIHRoZSBvdGhlciBCTUNzDQp3b3JrIGFzIHNlY29uZGFyaWVzLg0KDQojIyBS
ZXF1aXJlbWVudHMNCkNoZWNrIGEgbW9kdWxhciBzeXN0ZW0gYXMgZWl0aGVyIDRTLzhTIG9y
IHN0YW5kYWxvbmUgbW9kZSBieSBHUElPcyBvbiBCTUMgZWFjaA0KdGltZSBzeXN0ZW0gQUMg
b24uDQpFYWNoIEJNQyB3b3JrcyBpbmRlcGVuZGVudGx5IGluIHN0YW5kYWxvbmUgbW9kZS4N
CkluIDRTLzhTIG1vZGUsIG9ubHkgcHJpbWFyeSBCTUMgaXMgcmVzcG9uc2libGUgZm9yIG1h
bmFnZW1lbnQgb2Ygc3lzdGVtIGxldmVsDQpyZXNvdXJjZXMsIHNlY29uZGFyeSBCTUNzIG5l
ZWQgdG8gY29sbGVjdCBpdHMgbG9jYWwgbWFuYWdlbWVudCByZXNvdXJjZXMgYW5kIHJlcG9y
dA0KdGhlbSB0byBwcmltYXJ5IEJNQy4NCg0KIyMgUHJvcG9zZWQgRGVzaWduDQpFYWNoIEJN
QyB3aWxsIGhhdmUgYSBwcm9wZXJ0eSB0byByZXZlYWwgaXRzIHdvcmsgbW9kZS4gVXNlcnMg
Y2FuIGtub3cgaWYgQk1DIGlzIGluIHN0YW5kYWxvbmUgbW9kZSBvciA0Uy84UyBtb2RlLg0K
RWFjaCBCTUMgaGFzIGFub3RoZXIgcHJvcGVydHkgdG8gc2hvdyBpZiB0aGUgQk1DIG1vZGUg
aXMgUENIIExlZ2FjeSBCTUMgb3INCk5vbi1MZWdhY3kgQk1DLiBQQ0ggTGVnYWN5IEJNQyBp
cyB3b3JraW5nIGFzIHByaW1hcnkgYW5kIE5vbi1MZWdhY3kgQk1DIHdvcmtpbmcNCmFzIHNl
Y29uZGFyeS4NCg0KRWFjaCB0aW1lIGEgQk1DIHJlYm9vdCwgVGhlIEJNQyBuZWVkcyB0byBj
aGVjayAzIEdQSU8gUGluczogRk1fU1RBTkRBTE9ORV9NT05ERV9OIC8gRk1fNFNfOFNfTl9N
T0RFIC8gRk1fTk9ERV9JRCB0byBnZXQgd29ya2luZyBtb2RlIGFzIHN0YW5kYWxvbmUgbW9k
ZSBvciBwcmltYXJ5IC9zZWNvbmRhcnkoNFMvOFMpIHJvbGUgYWNjb3JkaW5nIHRvIHRoZSBH
UElPIHZhbHVlcy4NCkFmdGVyIGNvbmZpcm1pbmcgdGhlIG1vZGUgYW5kIEJNQ3MnIHJvbGUs
IEJNQ3Mgc2hvdWxkIHNldCBwcm9wZXJ0aWVzIGFjY29yZGluZw0KdG8gdGhlIGNvcnJlY3Qg
Y29uZmlndXJhdGlvbi4NCkluIDRTLzhTIG1vZGUgb25seSBub2RlIGlkIDAgd2lsbCBiZSBw
cmltYXJ5IEJNQyBiZWNhdXNlIG9ubHkgdGhpcyBub2RlIHdpbGwgYmUgdGhlIFBDSC5MLiBO
b2RlIGlkIDEsMiwzIHdpbGwgYmUgdGhlIHNlY29uZGFyeSBub2Rlcy4NCg0KT25jZSBhIEJN
QyBnZXRzIG1vZGUgaXMgaW4gNFMvOFMsIG5vZGUgcm9sZXMgYXJlIGNvbmZpZ3VyZWQgYnkg
bm9kZQ0KSUQgKEdQSU8gUGlucykgYW5kIGtlZXAgY29uc2lzdGVudCBvbmNlIEFDIG9uLiBP
bmNlIG5vZGUgcm9sZSBjaGVjayBpcyBkb25lLA0KDQpJbiA0Uy84UyBtb2RlLCBQcmltYXJ5
IEJNQyBuZWVkcyB0byBicm9hZGNhc3QgaXRzIHJvbGUgdG8gbWFrZSBzdXJlIHRoZXJlIGlz
IG9ubHkNCm9uZSBwcmltYXJ5IEJNQyBpbiB0aGUgc3lzdGVtLg0KDQpOZWVkIGEgbmV3IGZl
YXR1cmUgdG8gbWFrZSBzdXJlIHNlY29uZGFyeSBCTUNzIHNlbmQgbG9jYWwgcmVkZmlzaCBl
dmVudHMgdG8gcHJpbWFyeQ0KQk1DLiBBbmQgcHJpbWFyeSBCTUMgbmVlZHMgdG8gYWRkIGEg
dGFnIHRvIHRob3NlIGV2ZW50cyBjb21pbmcgZnJvbSBzZWNvbmRhcnkgQk1DIHNvDQp0aGF0
IHVzZXIgY2FuIGtub3cgdGhlIGV2ZW50IGxvZ3MgaGFwcGVuZWQgb24gd2hpY2ggbm9kZS4N
Cg0KRXZlbiBpbiA0Uy84UyBtb2RlLCBlYWNoIEJNQyB3aWxsIGNvbGxlY3QgaXRzIGxvY2Fs
IG1hbmFnZW1lbnQgcmVzb3VyY2VzLA0KaW5jbHVkaW5nIHNlbnNvcnMsIGZhbnMgYW5kIGRv
IEZTQyBhY2NvcmRpbmcgdG8gdGhlIHZhbHVlcyBvZiBsb2NhbCBzZW5zb3JzLg0KUFNVIGFu
ZCBGYW5zIG9uIGVhY2ggbm9kZSB3aWxsIG5vdCBiZSBjb25uZWN0ZWQgdG9nZXRoZXIuIENv
bmZpZ3VyYXRpb24NCnNldHRpbmdzIG9mIGVhY2ggc2Vjb25kYXJ5IG5vZGUgd2lsbCByZW1h
aW4gdGhlIHNhbWUsIGFuZCB3b24ndCBiZSBzeW5jZWQgYWNyb3NzDQp0aGUgbm9kZXMuDQoN
CkluIDRTLzhTIG1vZGUsIFBFQ0kgd2lsbCBvbmx5IGJlIGNvbm5lY3RlZCB0byBwcmltYXJ5
IG5vZGUuIFByaW1hcnkgQk1DIG5lZWRzIHRvDQptb25pdG9yIGFsbCBDUFUgYW5kIERJTU0g
c2Vuc29ycyBhbmQgZGVsaXZlciB0aGUgc2Vuc29yIHZhbHVlcyBvZiB0aGUgQ1BVcy9ESU1N
cw0Kb24gc2Vjb25kYXJ5IG5vZGVzIHRvIHNlY29uZGFyeSBCTUNzLiBTbyB0aGF0IHNlY29u
ZGFyeSBCTUNzIGNhbiB1c2UgdGhlIHNlbnNvciB2YWx1ZXMgdG8gY29udHJvbCB0aGVpciBv
d24gRlNDcy4gUHJpbWFyeSBCTUMgYWxzbyBuZWVkcyB0byBoYXZlIGEgd2F5IHRvIGZpbmQg
aG93IG1hbnkNCkNQVXMgYXJlIGluIHRoZSB3aG9sZSBzeXN0ZW0gaW5jbHVkZSBQcmltYXJ5
IGFuZCBTZWNvbmRhcnkgbm9kZXMuDQoNCiMjIEFsdGVybmF0aXZlcyBDb25zaWRlcmVkDQpQ
cmltYXJ5IG5vZGUgbW9uaXRvcnMgYWxsIHRoZSBJUE1JIHNlbnNvcnMgaW4gc2Vjb25kYXJ5
IG5vZGVzIGFuZCBjcmVhdGVzIHJlZGZpc2ggbG9nDQpieSBpdHNlbGYuDQoNCkluc3RlYWQg
b2YgQk1DIHJlYm9vdCwgb25seSBBQyBjeWNsZSB3aWxsIG1ha2UgQk1DcyBjaGVjayBHUElP
IHBpbnMgYW5kIHNldA0KTGVnYWN5IEJNQyBvciBOb24tTGVnYWN5IEJNQyBtb2RlLg0KDQpP
bmx5IHByaW1hcnkgQk1DIGJyb2FkY2FzdCBpdHMgcm9sZSBhbmQgc2Vjb25kYXJ5IG9ubHkg
d2FpdGluZyBmb3IgdGhlIGJyb2FkY2FzdA0KZnJvbSBwcmltYXJ5Lg0KDQojIyBJbXBhY3Rz
DQpPbmx5IG9uIHRoZSBtb3RoZXJib2FyZCB3aGVyZSBsZWdhY3kgUENIIGlzIGxvY2F0ZWQs
IFBPU1QgY29kZS9Gcm9udCBQYW5lbC9LQ1MNCnBvcnQvVUFSVCB3aWxsIHdvcmssIHdoaWxl
IHRoZXNlIGludGVyZmFjZXMgb24gYm9hcmQgd2l0aCBub24tbGVnYWN5IFBDSCB3aWxsDQpu
b3Qgd29yayBkdWUgdG8gQklPUyBhbmQgSFcgZGVzaWduLiBBbmQgdGhpcyB3aWxsIGNhdXNl
IG5vbi1mdW5jdGlvbmluZyBvZg0KU09ML0tWTS9WaXJ0dWFsIG1lZGlhIG9uIHNlY29uZGFy
eSBCTUNzLg0K
--------------8FFBD235595E2F08A7FBA6DD--
