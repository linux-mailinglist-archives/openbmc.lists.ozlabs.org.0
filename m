Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF3D9E5B9
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 12:33:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HlZv0sTCzDqXv
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 20:33:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HlZF5pw2zDqCp
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 20:32:53 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RAWjdb126010
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 06:32:50 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2un1maufen-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 06:32:48 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 27 Aug 2019 11:32:33 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 27 Aug 2019 11:32:30 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7RAWTsW41353218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 10:32:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CDA352057
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 10:32:29 +0000 (GMT)
Received: from [9.202.13.25] (unknown [9.202.13.25])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 014C55204F
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 10:32:28 +0000 (GMT)
Subject: Re: custom ntp server in phosphor-networkd
To: openbmc@lists.ozlabs.org
References: <20190826162517.GA19876@bbwork.lan>
 <20190826172315.GB45301@mauery.jf.intel.com>
 <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
 <20190827074336.GA14200@bbwork.lan>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Tue, 27 Aug 2019 16:02:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827074336.GA14200@bbwork.lan>
Content-Type: multipart/alternative;
 boundary="------------4F0E0D0841B59B3FF81A2EBA"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19082710-0020-0000-0000-00000364717E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082710-0021-0000-0000-000021B9BDBD
Message-Id: <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270120
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

This is a multi-part message in MIME format.
--------------4F0E0D0841B59B3FF81A2EBA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/19 1:13 PM, Alexander A. Filippov wrote:
> On Mon, Aug 26, 2019 at 10:23:15AM -0700, Vernon Mauery wrote:
>> This is pretty common behavior for DHCP settings.
>
> On Tue, Aug 27, 2019 at 11:28:36AM +0530, Ratan Gupta wrote:
>> Why this is wrong,
> Ok, ok.  I wasn't clear enough. My appologies.
>
> I've meant that the impossibility to add a custom ntp server while dhcp is
> enabled is wrong. Of course, the list of ntp servers received from DHCP-server
> must be used. And I propose to move only manual settings.
>
> I believe that it is a same stuff with DNS-servers, routes. But probably, the
> BMC is not such kind of devices which is required such deep settings. One of the
> possible reasons was specified by Vernon quoted below:
>
> On Mon, Aug 26, 2019 at 10:23:15AM -0700, Vernon Mauery wrote:
>> It seems to me that if you are using static settings for your network,
>> then you would also have static (or user-supplied) settings for NTP and
>> DNS. But if you are using DHCP for the network, it would make sense to
>> use the NTP and DNS settings supplied by the DHCP server.
>>
>> Now it might also be nice to have some reasonable defaults for NTP
>> servers. It is not uncommon to have IP gateways also be NTP servers, so
>> it might be reasonable to attempt to use the gateway as an NTP server if
>> none was specified in the DHCP response. I don't like the idea of
>> setting the default NTP server to be something that is globally
>> addressable because that makes the assumption that the BMC can reach
>> global networks, which should not be the case.
I have the following suggestion


=> By default all the DHCP optional parameters will be set to false(i.e 
Don't ask the optional info from the DHCP server) => If users wants the 
DHCP provided configuration then it has to set the specific optional 
parameters to true(Say NTPEnabled=true). => User configures the Static 
NTP => Check if DHCP is enabled then look for the DHCP configuration 
parameters, if "NTP Enabled is true"
then user wants the NTP server from the DHCP and in that case don't 
allow the static configuration.
=> if DHCP is enabled but in DHCP configuration parameters "NTP Enabled 
is false"
then user doesn't want the NTP server from the DHCP and allow the static 
configuration.

Link: 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/DHCPConfiguration.interface.yaml

Note: It may happen that user has set DHCP Configuration parameters on 
the BMC to take the NTP server details from the
DHCP server but have not configured the DHCP server to provide the NTP 
server, in that case
Static NTP server configuration will not be allowed.
>
> On Tue, Aug 27, 2019 at 11:28:36AM +0530, Ratan Gupta wrote:
>>   * The NTP servers defined in|/etc/systemd/timesyncd.conf|will be
>>     appended to the per-interface list at runtime and the daemon will
>>     contact the servers in turn until one is found that responds.
> So, my propose is to implement this point.
>
> Regards,
> Alexander
>

--------------4F0E0D0841B59B3FF81A2EBA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRl
eHQ9IiMwMDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPGRpdiBjbGFzcz0ibW96LWNp
dGUtcHJlZml4Ij5PbiAyNy8wOC8xOSAxOjEzIFBNLCBBbGV4YW5kZXIgQS4KICAgICAgRmls
aXBwb3Ygd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
IiBjaXRlPSJtaWQ6MjAxOTA4MjcwNzQzMzYuR0ExNDIwMEBiYndvcmsubGFuIj4KICAgICAg
PHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5PbiBNb24sIEF1ZyAyNiwgMjAx
OSBhdCAxMDoyMzoxNUFNIC0wNzAwLCBWZXJub24gTWF1ZXJ5IHdyb3RlOgo8L3ByZT4KICAg
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1
b3RlLXByZSIgd3JhcD0iIj5UaGlzIGlzIHByZXR0eSBjb21tb24gYmVoYXZpb3IgZm9yIERI
Q1Agc2V0dGluZ3MuCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgY2xh
c3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CgpPbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAx
MToyODozNkFNICswNTMwLCBSYXRhbiBHdXB0YSB3cm90ZToKPC9wcmU+CiAgICAgIDxibG9j
a3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUi
IHdyYXA9IiI+V2h5IHRoaXMgaXMgd3JvbmcsCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+
CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+Ck9rLCBvay4gIEkg
d2Fzbid0IGNsZWFyIGVub3VnaC4gTXkgYXBwb2xvZ2llcy4KCkkndmUgbWVhbnQgdGhhdCB0
aGUgaW1wb3NzaWJpbGl0eSB0byBhZGQgYSBjdXN0b20gbnRwIHNlcnZlciB3aGlsZSBkaGNw
IGlzCmVuYWJsZWQgaXMgd3JvbmcuIE9mIGNvdXJzZSwgdGhlIGxpc3Qgb2YgbnRwIHNlcnZl
cnMgcmVjZWl2ZWQgZnJvbSBESENQLXNlcnZlcgptdXN0IGJlIHVzZWQuIEFuZCBJIHByb3Bv
c2UgdG8gbW92ZSBvbmx5IG1hbnVhbCBzZXR0aW5ncy4KCkkgYmVsaWV2ZSB0aGF0IGl0IGlz
IGEgc2FtZSBzdHVmZiB3aXRoIEROUy1zZXJ2ZXJzLCByb3V0ZXMuIEJ1dCBwcm9iYWJseSwg
dGhlCkJNQyBpcyBub3Qgc3VjaCBraW5kIG9mIGRldmljZXMgd2hpY2ggaXMgcmVxdWlyZWQg
c3VjaCBkZWVwIHNldHRpbmdzLiBPbmUgb2YgdGhlCnBvc3NpYmxlIHJlYXNvbnMgd2FzIHNw
ZWNpZmllZCBieSBWZXJub24gcXVvdGVkIGJlbG93OgoKT24gTW9uLCBBdWcgMjYsIDIwMTkg
YXQgMTA6MjM6MTVBTSAtMDcwMCwgVmVybm9uIE1hdWVyeSB3cm90ZToKPC9wcmU+CiAgICAg
IDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+SXQgc2VlbXMgdG8gbWUgdGhhdCBpZiB5b3UgYXJlIHVzaW5nIHN0
YXRpYyBzZXR0aW5ncyBmb3IgeW91ciBuZXR3b3JrLCAKdGhlbiB5b3Ugd291bGQgYWxzbyBo
YXZlIHN0YXRpYyAob3IgdXNlci1zdXBwbGllZCkgc2V0dGluZ3MgZm9yIE5UUCBhbmQgCkRO
Uy4gQnV0IGlmIHlvdSBhcmUgdXNpbmcgREhDUCBmb3IgdGhlIG5ldHdvcmssIGl0IHdvdWxk
IG1ha2Ugc2Vuc2UgdG8gCnVzZSB0aGUgTlRQIGFuZCBETlMgc2V0dGluZ3Mgc3VwcGxpZWQg
YnkgdGhlIERIQ1Agc2VydmVyLgoKTm93IGl0IG1pZ2h0IGFsc28gYmUgbmljZSB0byBoYXZl
IHNvbWUgcmVhc29uYWJsZSBkZWZhdWx0cyBmb3IgTlRQIApzZXJ2ZXJzLiBJdCBpcyBub3Qg
dW5jb21tb24gdG8gaGF2ZSBJUCBnYXRld2F5cyBhbHNvIGJlIE5UUCBzZXJ2ZXJzLCBzbyAK
aXQgbWlnaHQgYmUgcmVhc29uYWJsZSB0byBhdHRlbXB0IHRvIHVzZSB0aGUgZ2F0ZXdheSBh
cyBhbiBOVFAgc2VydmVyIGlmIApub25lIHdhcyBzcGVjaWZpZWQgaW4gdGhlIERIQ1AgcmVz
cG9uc2UuIEkgZG9uJ3QgbGlrZSB0aGUgaWRlYSBvZiAKc2V0dGluZyB0aGUgZGVmYXVsdCBO
VFAgc2VydmVyIHRvIGJlIHNvbWV0aGluZyB0aGF0IGlzIGdsb2JhbGx5IAphZGRyZXNzYWJs
ZSBiZWNhdXNlIHRoYXQgbWFrZXMgdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgQk1DIGNhbiBy
ZWFjaCAKZ2xvYmFsIG5ldHdvcmtzLCB3aGljaCBzaG91bGQgbm90IGJlIHRoZSBjYXNlLgo8
L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHR0Pkkg
aGF2ZSB0aGUgZm9sbG93aW5nIHN1Z2dlc3Rpb248L3R0Pjx0dD48YnI+CiAgICA8L3R0Pjx0
dD48YnI+CiAgICA8L3R0Pjx0dD48YnI+CiAgICA8L3R0Pjx0dD48c3BhbiBzdHlsZT0iY29s
b3I6IHJnYigzMywgMzMsIDMzKTsgZm9udC1zaXplOiAxM3B4OyBmb250LXN0eWxlOiBub3Jt
YWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6
IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4
dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25l
OyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRl
eHQtc3Ryb2tlLXdpZHRoOiAwcHg7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwg
MjU1KTsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24t
Y29sb3I6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyBmbG9hdDogbm9u
ZTsiPj0mZ3Q7IEJ5IGRlZmF1bHQgYWxsIHRoZSBESENQIG9wdGlvbmFsIHBhcmFtZXRlcnMg
d2lsbCBiZSBzZXQgdG8gZmFsc2UoaS5lIERvbid0IGFzayB0aGUgb3B0aW9uYWwgaW5mbyBm
cm9tIHRoZSBESENQIHNlcnZlcikKPSZndDsgSWYgdXNlcnMgd2FudHMgdGhlIERIQ1AgcHJv
dmlkZWQgY29uZmlndXJhdGlvbiB0aGVuIGl0IGhhcyB0byBzZXQgdGhlIHNwZWNpZmljIG9w
dGlvbmFsIHBhcmFtZXRlcnMgdG8gdHJ1ZShTYXkgTlRQRW5hYmxlZD10cnVlKS4KPSZndDsg
VXNlciBjb25maWd1cmVzIHRoZSBTdGF0aWMgTlRQCj0mZ3Q7IENoZWNrIGlmIERIQ1AgaXMg
ZW5hYmxlZCB0aGVuIGxvb2sgZm9yIHRoZSBESENQIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVy
cywgaWYgIk5UUCBFbmFibGVkIGlzIHRydWUiPC9zcGFuPjwvdHQ+PHR0Pjxicj4KICAgIDwv
dHQ+PHR0PjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDMzLCAzMywgMzMpOyBmb250LXNpemU6
IDEzcHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9y
bWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0
ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC1z
cGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3Vu
ZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGlu
aXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5l
ICFpbXBvcnRhbnQ7IGZsb2F0OiBub25lOyI+dGhlbiB1c2VyIHdhbnRzIHRoZSBOVFAgc2Vy
dmVyIGZyb20gdGhlIERIQ1AgYW5kIGluIHRoYXQgY2FzZSBkb24ndCBhbGxvdyB0aGUgc3Rh
dGljIGNvbmZpZ3VyYXRpb24uPC9zcGFuPjwvdHQ+PHR0Pjxicj4KICAgIDwvdHQ+PHR0Pjxz
cGFuIHN0eWxlPSJjb2xvcjogcmdiKDMzLCAzMywgMzMpOyBmb250LXNpemU6IDEzcHg7IGZv
bnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250
LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2lu
Zzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10
cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC1zcGFjaW5nOiAw
cHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xvcjog
cmdiKDI1NSwgMjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRl
eHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRh
bnQ7IGZsb2F0OiBub25lOyI+PSZndDsgaWYgREhDUCBpcyBlbmFibGVkIGJ1dCBpbiBESENQ
IGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycyAiPC9zcGFuPjwvdHQ+PHR0PjxzcGFuIHN0eWxl
PSJjb2xvcjogcmdiKDMzLCAzMywgMzMpOyBmb250LXNpemU6IDEzcHg7IGZvbnQtc3R5bGU6
IG5vcm1hbDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQt
Y2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFs
OyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06
IG5vbmU7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJr
aXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwg
MjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3Jh
dGlvbi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0
OiBub25lOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzMsIDMzLCAzMyk7IGZvbnQtc2l6
ZTogMTNweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBu
b3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxl
dHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDog
MHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyB3b3Jk
LXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyBiYWNrZ3Jv
dW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IHRleHQtZGVjb3JhdGlvbi1zdHlsZTog
aW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyBkaXNwbGF5OiBpbmxp
bmUgIWltcG9ydGFudDsgZmxvYXQ6IG5vbmU7Ij5OVFAgRW5hYmxlZCBpcyBmYWxzZTwvc3Bh
bj4iPC9zcGFuPjwvdHQ+PHR0Pjxicj4KICAgIDwvdHQ+PHR0PjxzcGFuIHN0eWxlPSJjb2xv
cjogcmdiKDMzLCAzMywgMzMpOyBmb250LXNpemU6IDEzcHg7IGZvbnQtc3R5bGU6IG5vcm1h
bDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczog
bm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0
LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7
IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4
dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAy
NTUpOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1j
b2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25l
OyI+dGhlbiB1c2VyIGRvZXNuJ3Qgd2FudCB0aGUgTlRQIHNlcnZlciBmcm9tIHRoZSBESENQ
IGFuZCBhbGxvdyB0aGUgc3RhdGljIGNvbmZpZ3VyYXRpb24uPC9zcGFuPjwvdHQ+PHR0Pjxi
cj4KICAgIDwvdHQ+PHR0Pjxicj4KICAgIDwvdHQ+PHR0Pkxpbms6IDwvdHQ+PHR0PjxhIGhy
ZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWRidXMtaW50ZXJmYWNl
cy9ibG9iL21hc3Rlci94eXovb3BlbmJtY19wcm9qZWN0L05ldHdvcmsvREhDUENvbmZpZ3Vy
YXRpb24uaW50ZXJmYWNlLnlhbWwiIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIiBj
bGFzcz0ic3R5bGUtc2NvcGUgZ3ItbGlua2VkLXRleHQiIHN0eWxlPSJib3gtc2l6aW5nOiBi
b3JkZXItYm94OyBtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBib3JkZXI6IDBweCBub25l
OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsg
Zm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC12YXJpYW50LW51bWVyaWM6IGluaGVy
aXQ7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBpbmhlcml0OyBmb250LXdlaWdodDogNDAw
OyBmb250LXN0cmV0Y2g6IGluaGVyaXQ7IGZvbnQtc2l6ZTogMTNweDsgbGluZS1oZWlnaHQ6
IGluaGVyaXQ7IHZlcnRpY2FsLWFsaWduOiBiYXNlbGluZTsgY29sb3I6IHJnYig0MiwgMTAy
LCAyMTcpOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4
dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBwcmUt
d3JhcDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBw
eDsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+aHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzL2Jsb2IvbWFzdGVyL3h5
ei9vcGVuYm1jX3Byb2plY3QvTmV0d29yay9ESENQQ29uZmlndXJhdGlvbi5pbnRlcmZhY2Uu
eWFtbDwvYT48L3R0Pjx0dD48YnI+CiAgICA8L3R0Pjx0dD48c3BhbiBzdHlsZT0iY29sb3I6
IHJnYigzMywgMzMsIDMzKTsgZm9udC1zaXplOiAxM3B4OyBmb250LXN0eWxlOiBub3JtYWw7
IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5v
cm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1h
bGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3
aGl0ZS1zcGFjZTogcHJlLXdyYXA7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQt
c3Ryb2tlLXdpZHRoOiAwcHg7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1
KTsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29s
b3I6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsi
Pjwvc3Bhbj48L3R0Pjx0dD48YnI+CiAgICA8L3R0Pjx0dD5Ob3RlOiBJdCBtYXkgaGFwcGVu
IHRoYXQgdXNlciBoYXMgc2V0IERIQ1AgQ29uZmlndXJhdGlvbgogICAgICBwYXJhbWV0ZXJz
IG9uIHRoZSBCTUMgdG8gdGFrZSB0aGUgTlRQIHNlcnZlciBkZXRhaWxzIGZyb20gdGhlPC90
dD48dHQ+PGJyPgogICAgPC90dD48dHQ+REhDUCBzZXJ2ZXIgYnV0IGhhdmUgbm90IGNvbmZp
Z3VyZWQgdGhlIERIQ1Agc2VydmVyIHRvCiAgICAgIHByb3ZpZGUgdGhlIE5UUCBzZXJ2ZXIs
IGluIHRoYXQgY2FzZTwvdHQ+PHR0Pjxicj4KICAgIDwvdHQ+PHR0PlN0YXRpYyBOVFAgc2Vy
dmVyIGNvbmZpZ3VyYXRpb24gd2lsbCBub3QgYmUgYWxsb3dlZC48L3R0PgogICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOjIwMTkwODI3MDc0MzM2LkdBMTQyMDBAYmJ3
b3JrLmxhbiI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CgpP
biBUdWUsIEF1ZyAyNywgMjAxOSBhdCAxMToyODozNkFNICswNTMwLCBSYXRhbiBHdXB0YSB3
cm90ZToKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxw
cmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+ICogVGhlIE5UUCBzZXJ2ZXJzIGRl
ZmluZWQgaW58L2V0Yy9zeXN0ZW1kL3RpbWVzeW5jZC5jb25mfHdpbGwgYmUKICAgYXBwZW5k
ZWQgdG8gdGhlIHBlci1pbnRlcmZhY2UgbGlzdCBhdCBydW50aW1lIGFuZCB0aGUgZGFlbW9u
IHdpbGwKICAgY29udGFjdCB0aGUgc2VydmVycyBpbiB0dXJuIHVudGlsIG9uZSBpcyBmb3Vu
ZCB0aGF0IHJlc3BvbmRzLgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJl
IGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpTbywgbXkgcHJvcG9zZSBpcyB0byBp
bXBsZW1lbnQgdGhpcyBwb2ludC4KClJlZ2FyZHMsCkFsZXhhbmRlcgoKPC9wcmU+CiAgICA8
L2Jsb2NrcXVvdGU+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
--------------4F0E0D0841B59B3FF81A2EBA--

