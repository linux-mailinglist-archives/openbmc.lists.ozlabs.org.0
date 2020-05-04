Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D11C3FA9
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 18:19:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G7Mr511QzDqSx
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 02:19:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G7H673CGzDqSk
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 02:14:51 +1000 (AEST)
IronPort-SDR: 5HJdzCi2X96HSBwax1IsJe5i7jRwodO5PFKiiJBSTvGp1SGQkYF9Wc0iZGoOiV+3mjlyS/GEX0
 fc/EimnImOSA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 09:14:49 -0700
IronPort-SDR: tWKc2/xoy+f150gdymexdKONrTcwLfU3dJR5Th5xyMM5zwil3y9L3jpZ57MlYsNps7NdaXPOa+
 KGJmawRK8Rbw==
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; 
 d="asc'?scan'208,217";a="294669262"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 09:14:48 -0700
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
 <CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com>
 <32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com>
 <7c9a2b08-1224-9828-9175-41566532602a@intel.com>
 <1f8f6dd4-c62e-7165-c1ba-7466e407d594@linux.vnet.ibm.com>
 <35251645-af06-5ab5-9e1b-8e6eaa44f650@intel.com>
 <d523bbb9-59a4-4b15-6527-68f842c0f3ec@linux.vnet.ibm.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Autocrypt: addr=johnathanx.mantey@intel.com; prefer-encrypt=mutual; keydata=
 mQENBFija08BCAC60TO2X22b0tJ2Gy2iQLWx20mGcD7ugBpm1o2IW2M+um3GR0BG/bUcLciw
 dEnX9SWT30jx8TimenyUYeDS1CKML/e4JnCAUhSktNZRPBjzla991OkpqtFJEHj/pHrXTsz0
 ODhmnSaZ49TsY+5BqtRMexICYOtSP8+xuftPN7g2pQNFi7xYlQkutP8WKIY3TacW/6MPiYek
 pqVaaF0cXynCMDvbK0km7m0S4X01RZFKXUwlbuMireNk4IyZ/59hN+fh1MYMQ6RXOgmHqxSu
 04GjkbBLf2Sddplb6KzPMRWPJ5uNdvlkAfyT4P0R5EfkV5wCRdoJ1lNC9WI1bqHkbt07ABEB
 AAG0JUpvaG5hdGhhbiBNYW50ZXkgPG1hbnRleWpnQGdtYWlsLmNvbT6JATcEEwEIACEFAlij
 a08CGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQ0EfviT3fHwmcBAgAkENzQ8s0RK+f
 nr4UogrCBS132lDdtlOypm1WgGDOVQNra7A1rvXFgN05RqrdRTpRevv7+S8ipbiG/kxn9P8+
 VhhW1SvUT8Tvkb9YYHos6za3v0YblibFNbYRgQcybYMeKz2/DcVU+ioKZ1SxNJsFXx6wH71I
 V2YumQRHAsh4Je6CmsiMVP4XNadzCQXzzcU9sstKV0A194JM/d8hjXfwMHZE6qnKgAkHIV3Q
 61YCuvkdr5SJSrOVo2IMN0pVxhhW7lqCAGBGb4oOhqePwGqOabU3Ui4qTbHP2BWP5UscehkK
 6TVKcpYApsUcWyxvvOARoktmlPnGYqJPnRwXpQBlqLkBDQRYo2tPAQgAyOv5Lgg2VkHO84R7
 LJJDBxcaCDjyAvHBynznEEk11JHrPuonEWi6pqgB8+Kc588/GerXZqJ9AMkR43UW/5cPlyF2
 wVO4aYaQwryDtiXEu+5rpbQfAvBpKTbrBfYIPc8thuAC2kdB4IO24T6PVSYVXYc/giOL0Iwb
 /WZfMd5ajtKfa727xfbKCEHlzakqmUl0SyrARdrSynhX1R9Wnf2BwtUV7mxFxtMukak0zdTf
 2IXZXDltZC224vWqkXiI7Gt/FDc2y6gcsYY/4a2+vjhWuZk3lEzP0pbXQqOseDM1zZXln/m7
 BFbJ6VUn1zWcrt0c82GTMqkeGUheUhDiYLQ7xwARAQABiQEfBBgBCAAJBQJYo2tPAhsMAAoJ
 ENBH74k93x8JKEUH/3UPZryjmM0F3h8I0ZWuruxAxiqvksLOOtarU6RikIAHhwjvluEcTH4E
 JsDjqtRUvBMU907XNotpqpW2e9jN8tFRyR4wW9CYkilB02qgrDm9DXVGb2BDtC/MY+6KUgsG
 k5Ftr9uaXNd0K4IGRJSyU6ZZn0inTcXlqD+NgOE2eX9qpeKEhDufgF7fKHbKDkS4hj6Z09dT
 Y8eW9d6d2Yf/RzTBJvZxjBFbIgeUGeykbSKztp2OBe6mecpVPhKooTq+X/mJehpRA6mAhuQZ
 28lvie7hbRFjqR3JB7inAKL4eT1/9bT/MqcPh43PXTAzB6/Iclg5B7GGgEFe27VL0hyqiqc=
Message-ID: <cae1cc3d-b4f3-ac09-e023-b469b45cc478@intel.com>
Date: Mon, 4 May 2020 09:14:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d523bbb9-59a4-4b15-6527-68f842c0f3ec@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5bPp41vj7FCljEleRCYwnRPg2krRgkL93"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5bPp41vj7FCljEleRCYwnRPg2krRgkL93
Content-Type: multipart/mixed; boundary="YDB18r7iSE401wIX2zMlixfC8erZjVtiu"

--YDB18r7iSE401wIX2zMlixfC8erZjVtiu
Content-Type: multipart/alternative;
 boundary="------------614AF368A29948D3DA5E8F03"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------614AF368A29948D3DA5E8F03
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ratan,

We're not using Windows. What is the Linux kernel/systemd going to do
for the Metric? So far the only value that has been applied to the
Metric is "0" (assigned by ??). As the Microsoft article points out,
using a low value Metric for "private" nets is to be avoided.
Our DHCP servers are supplying a Metric value of 1024. I'm sure other
network managers use different values.
I don't know how to solve this issue. Especially for the IPMI use case
of assigning a static address. IPMI doesn't have the ability to assign
metric values. At least with Redfish we can have that feature added.

On 5/4/20 6:38 AM, Ratan Gupta wrote:
>
>
> On 4/29/20 12:19 AM, Johnathan Mantey wrote:
>> I think I understand most of your plan.
>>
>> What does it mean to "use the default metric"?
>
> https://support.microsoft.com/en-in/help/299540/an-explanation-of-the-a=
utomatic-metric-feature-for-ipv4-routes
>
> Instead of user level application assigns the metric value, Let the
> kernel decide which gateway should be used.
>
> I understand that there should be a way through which we should be
> able to change the metric value=C2=A0 but that can be implemented later=

> with some thing like route management where user should be able to add
> HostRoutes/Network routes etc, chnaging the values of the routes etc.
>
>>
>> On 4/28/20 8:16 AM, Ratan Gupta wrote:
>>>
>>> Hi Jonathan,
>>>
>>> On 4/28/20 1:00 AM, Johnathan Mantey wrote:
>>>> Ratan,
>>>>
>>>> Can you provide more info about how you plan to implement this?
>>> I am not getting, Do you mean to say how to get the per interface
>>> gateway from system?=C2=A0 that would be through netlink, and during
>>> configuration we would use the systemd-networkd file configuration.
>>>>
>>>> The Redfish schemas already have a per IP addr Gateway entry, which
>>>> OBMC is ignoring. Is it better to modify the existing D-Bus schema
>>>> (i.e. versioning discussion), or just use what is presently in
>>>> existence?
>>> Redfish schema are getting changed to accommodate this through the
>>> following issue https://github.com/DMTF/Redfish/issues/3609.
>>>
>>> The above issue(gateway/interface) exist only for the IPv4 redfish
>>> schema, IPv6 redfish is already having default gateway per interface
>>>
>>> http://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_5_1.json#/def=
initions/EthernetInterface
>>>
>>>>
>>>> That said, doing as you propose melds better with how IPMI (i.e Set
>>>> LAN Configuration Parameter 12) works.
>>>>
>>>> As Patrick pointed out, there's no IPMI or Redfish control over the
>>>> routing metric parameter. What are your thoughts on how to
>>>> reconcile applying a metric value?
>>> We will go with default metric value as today as underlying stack
>>> tries for fallback gateway.
>>>> I've long been desirous of getting Williams submission merged:
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/207=
99
>>>> as it can be used to improve the collection of netlink stats.
>>>>
>>>> Redfish exacerbates this whole problem by allowing a collection of
>>>> static IP addresses (and a DHCP addr) per NIC, unlike IPMI which
>>>> was very one to one with IP addr/NIC.
>>>>
>>>> Thanks for investigating this and working to implement a solution.
>>>>
>>>> On 4/27/20 4:11 AM, Ratan Gupta wrote:
>>>>>
>>>>> Thanks Patrick, William for sharing the feedbacks
>>>>>
>>>>> I will start working on the changes.
>>>>>
>>>>>
>>>>> On 4/24/20 11:15 PM, William Kennington wrote:
>>>>>> Sounds good to me, we have needed this for a long time because
>>>>>> the current gateway configuration breaks our v6 stack with
>>>>>> multiple NICs.
>>>>>>
>>>>>> On Fri, Apr 24, 2020 at 8:21 AM Patrick Williams
>>>>>> <patrick@stwcx.xyz <mailto:patrick@stwcx.xyz>> wrote:
>>>>>>
>>>>>>     On Fri, Apr 24, 2020 at 08:36:26PM +0530, Ratan Gupta wrote:
>>>>>>     > ~~~~~~~~~~~~~
>>>>>>     > Kernel IP routing table
>>>>>>     > Destination=C2=A0=C2=A0=C2=A0=C2=A0 Gateway=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Genmask=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Flags=C2=A0=C2=A0 MSS
>>>>>>     Window=C2=A0 irtt
>>>>>>     > Iface
>>>>>>     > 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.1=
68.2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>>>>>>     0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>>>>>>     > eth0
>>>>>>     > 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.1=
0.10.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>>>>>>     0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>>>>>>     > eth1
>>>>>>     > ~~~~~~~~~~~~~~
>>>>>>     >
>>>>>>     > Kernel will first try using the default gateway having
>>>>>>     higher metric
>>>>>>     > value and then fall back to the lower.
>>>>>>
>>>>>>     I'm not seeing us with an interface to adjust the metric for a=
n
>>>>>>     interface.=C2=A0 I think we need to add that at the same time?=

>>>>>>
>>>>> Not now, As per my testing if metric value is not defined and both
>>>>> the routes
>>>>>
>>>>> having same metric then kernel tries one after other. We can bring
>>>>> the metric
>>>>>
>>>>> later.
>>>>>
>>>>>>     =C2=A0 Otherwise, I
>>>>>>     don't think we have a way to specify which interface
>>>>>>     outside-the-subnet
>>>>>>     should go (vs today we can set the default-gateway to the desi=
red
>>>>>>     interface's gateway).
>>>>>>     --=20
>>>>>>     Patrick Williams
>>>>>>
>>>>
>>>> --=20
>>>> Johnathan Mantey
>>>> Senior Software Engineer
>>>> *azad te**chnology partners*
>>>> Contributing to Technology Innovation since 1992
>>>> Phone: (503) 712-6764
>>>> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.c=
om>
>>>
>>> Ratan
>>>
>>
>> --=20
>> Johnathan Mantey
>> Senior Software Engineer
>> *azad te**chnology partners*
>> Contributing to Technology Innovation since 1992
>> Phone: (503) 712-6764
>> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com=
>
>>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------614AF368A29948D3DA5E8F03
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Ratan,<br>
    <br>
    We're not using Windows. What is the Linux kernel/systemd going to
    do for the Metric? So far the only value that has been applied to
    the Metric is "0" (assigned by ??). As the Microsoft article points
    out, using a low value Metric for "private" nets is to be avoided. <b=
r>
    Our DHCP servers are supplying a Metric value of 1024. I'm sure
    other network managers use different values.<br>
    I don't know how to solve this issue. Especially for the IPMI use
    case of assigning a static address. IPMI doesn't have the ability to
    assign metric values. At least with Redfish we can have that feature
    added.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 5/4/20 6:38 AM, Ratan Gupta wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:d523bbb9-59a4-4b15-6527-68f842c0f3ec@linux.vnet.ibm.com=
">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 4/29/20 12:19 AM, Johnathan Mante=
y
        wrote:<br>
      </div>
      <blockquote type=3D"cite"
        cite=3D"mid:35251645-af06-5ab5-9e1b-8e6eaa44f650@intel.com"> I
        think I understand most of your plan.<br>
        <br>
        What does it mean to "use the default metric"?<br>
      </blockquote>
      <p><a class=3D"moz-txt-link-freetext"
href=3D"https://support.microsoft.com/en-in/help/299540/an-explanation-of=
-the-automatic-metric-feature-for-ipv4-routes"
          moz-do-not-send=3D"true">https://support.microsoft.com/en-in/he=
lp/299540/an-explanation-of-the-automatic-metric-feature-for-ipv4-routes<=
/a></p>
      <p>Instead of user level application assigns the metric value, Let
        the kernel decide which gateway should be used.</p>
      <p>I understand that there should be a way through which we should
        be able to change the metric value=C2=A0 but that can be implemen=
ted
        later with some thing like route management where user should be
        able to add HostRoutes/Network routes etc, chnaging the values
        of the routes etc. <br>
      </p>
      <blockquote type=3D"cite"
        cite=3D"mid:35251645-af06-5ab5-9e1b-8e6eaa44f650@intel.com"> <br>=

        <div class=3D"moz-cite-prefix">On 4/28/20 8:16 AM, Ratan Gupta
          wrote:<br>
        </div>
        <blockquote type=3D"cite"
          cite=3D"mid:1f8f6dd4-c62e-7165-c1ba-7466e407d594@linux.vnet.ibm=
=2Ecom">
          <p>Hi Jonathan,</p>
          <div class=3D"moz-cite-prefix">On 4/28/20 1:00 AM, Johnathan
            Mantey wrote:<br>
          </div>
          <blockquote type=3D"cite"
            cite=3D"mid:7c9a2b08-1224-9828-9175-41566532602a@intel.com">
            Ratan,<br>
            <br>
            Can you provide more info about how you plan to implement
            this?<br>
          </blockquote>
          I am not getting, Do you mean to say how to get the per
          interface gateway from system?=C2=A0 that would be through netl=
ink,
          and during configuration we would use the systemd-networkd
          file configuration.<br>
          <blockquote type=3D"cite"
            cite=3D"mid:7c9a2b08-1224-9828-9175-41566532602a@intel.com"> =
<br>
            The Redfish schemas already have a per IP addr Gateway
            entry, which OBMC is ignoring. Is it better to modify the
            existing D-Bus schema (i.e. versioning discussion), or just
            use what is presently in existence?<br>
          </blockquote>
          Redfish schema are getting changed to accommodate this through
          the following issue <a class=3D"moz-txt-link-freetext"
            href=3D"https://github.com/DMTF/Redfish/issues/3609"
            moz-do-not-send=3D"true">https://github.com/DMTF/Redfish/issu=
es/3609</a>.<br>
          <p>The above issue(gateway/interface) exist only for the IPv4
            redfish schema, IPv6 redfish is already having default
            gateway per interface <br>
          </p>
          <p><a class=3D"moz-txt-link-freetext"
href=3D"http://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_5_1.json#=
/definitions/EthernetInterface"
              moz-do-not-send=3D"true">http://redfish.dmtf.org/schemas/v1=
/EthernetInterface.v1_5_1.json#/definitions/EthernetInterface</a><br>
          </p>
          <blockquote type=3D"cite"
            cite=3D"mid:7c9a2b08-1224-9828-9175-41566532602a@intel.com"> =
<br>
            That said, doing as you propose melds better with how IPMI
            (i.e Set LAN Configuration Parameter 12) works.<br>
            <br>
            As Patrick pointed out, there's no IPMI or Redfish control
            over the routing metric parameter. What are your thoughts on
            how to reconcile applying a metric value?<br>
          </blockquote>
          We will go with default metric value as today as underlying
          stack tries for fallback gateway.
          <blockquote type=3D"cite"
            cite=3D"mid:7c9a2b08-1224-9828-9175-41566532602a@intel.com">
            I've long been desirous of getting Williams submission
            merged: <a class=3D"moz-txt-link-freetext"
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/=
20799"
              moz-do-not-send=3D"true">https://gerrit.openbmc-project.xyz=
/c/openbmc/phosphor-networkd/+/20799</a><br>
            as it can be used to improve the collection of netlink
            stats.<br>
            <br>
            Redfish exacerbates this whole problem by allowing a
            collection of static IP addresses (and a DHCP addr) per NIC,
            unlike IPMI which was very one to one with IP addr/NIC. <br>
            <br>
            Thanks for investigating this and working to implement a
            solution.<br>
            <br>
            <div class=3D"moz-cite-prefix">On 4/27/20 4:11 AM, Ratan Gupt=
a
              wrote:<br>
            </div>
            <blockquote type=3D"cite"
              cite=3D"mid:32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet=
=2Eibm.com">
              <p>Thanks Patrick, William for sharing the feedbacks<br>
              </p>
              <p>I will start working on the changes.<br>
              </p>
              <p><br>
              </p>
              <div class=3D"moz-cite-prefix">On 4/24/20 11:15 PM, William=

                Kennington wrote:<br>
              </div>
              <blockquote type=3D"cite"
cite=3D"mid:CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmai=
l.com">
                <div dir=3D"ltr">Sounds good to me, we have needed this
                  for a long time because the current gateway
                  configuration breaks our v6 stack with multiple NICs.<b=
r>
                </div>
                <br>
                <div class=3D"gmail_quote">
                  <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 24, 2=
020
                    at 8:21 AM Patrick Williams &lt;<a
                      href=3D"mailto:patrick@stwcx.xyz"
                      moz-do-not-send=3D"true">patrick@stwcx.xyz</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">On Fri, Apr 24,
                    2020 at 08:36:26PM +0530, Ratan Gupta wrote:<br>
                    &gt; ~~~~~~~~~~~~~<br>
                    &gt; Kernel IP routing table<br>
                    &gt; Destination=C2=A0=C2=A0=C2=A0=C2=A0 Gateway=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Genmask=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
                    Flags=C2=A0=C2=A0 MSS Window=C2=A0 irtt <br>
                    &gt; Iface<br>
                    &gt; 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 19.168.2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
                    UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 <br>
                    &gt; eth0<br>
                    &gt; 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 10.10.10.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
                    UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 <br>
                    &gt; eth1<br>
                    &gt; ~~~~~~~~~~~~~~<br>
                    &gt; <br>
                    &gt; Kernel will first try using the default gateway
                    having higher metric <br>
                    &gt; value and then fall back to the lower.<br>
                    <br>
                    I'm not seeing us with an interface to adjust the
                    metric for an<br>
                    interface.=C2=A0 I think we need to add that at the s=
ame
                    time?</blockquote>
                </div>
              </blockquote>
              <p>Not now, As per my testing if metric value is not
                defined and both the routes</p>
              <p>having same metric then kernel tries one after other.
                We can bring the metric</p>
              <p>later.<br>
              </p>
              <blockquote type=3D"cite"
cite=3D"mid:CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmai=
l.com">
                <div class=3D"gmail_quote">
                  <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">=C2=A0 Otherwise, =
I<br>
                    don't think we have a way to specify which interface
                    outside-the-subnet<br>
                    should go (vs today we can set the default-gateway
                    to the desired<br>
                    interface's gateway).<br>
                    -- <br>
                    Patrick Williams<br>
                  </blockquote>
                </div>
              </blockquote>
            </blockquote>
            <br>
            <div class=3D"moz-signature">-- <br>
              <title></title>
              <font color=3D"#1F497D"><font face=3D"Century Gothic">Johna=
than
                  Mantey<br>
                  <small>Senior Software Engineer</small><br>
                  <big><font color=3D"#555555"><small><b>azad te</b><b>ch=
nology
                          partners</b></small><br>
                      <small><font color=3D"#1F497D"><small>Contributing
                            to Technology Innovation since 1992</small></=
font><small><br>
                          <font color=3D"#1F497D">Phone: (503) 712-6764<b=
r>
                            Email: <a
                              href=3D"mailto:johnathanx.mantey@intel.com"=

                              moz-do-not-send=3D"true">johnathanx.mantey@=
intel.com</a></font></small><br>
                      </small></font></big></font></font></div>
          </blockquote>
          <p><font color=3D"#1F497D"><font face=3D"Century Gothic">Ratan<=
/font></font></p>
        </blockquote>
        <br>
        <div class=3D"moz-signature">-- <br>
          <title></title>
          <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan=

              Mantey<br>
              <small>Senior Software Engineer</small><br>
              <big><font color=3D"#555555"><small><b>azad te</b><b>chnolo=
gy
                      partners</b></small><br>
                  <small><font color=3D"#1F497D"><small>Contributing to
                        Technology Innovation since 1992</small></font><s=
mall><br>
                      <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                        Email: <a
                          href=3D"mailto:johnathanx.mantey@intel.com"
                          moz-do-not-send=3D"true">johnathanx.mantey@inte=
l.com</a></font></small><br>
                    <br>
                  </small></font></big></font></font> </div>
      </blockquote>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=
>johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------614AF368A29948D3DA5E8F03--

--YDB18r7iSE401wIX2zMlixfC8erZjVtiu--

--5bPp41vj7FCljEleRCYwnRPg2krRgkL93
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl6wP3QACgkQ0EfviT3f
HwloUgf+MpBewtPo39dHfY6zEpD70MhOU8HEZ1W313+Pg44PqRLSHM2WGq/zibPf
Qyhef1rEPvYYrU1ns67++iIBUfvJfHVpIaylTxuG9QwRacbhfhYXkYlRFRpuK4Zw
zQVvLdFTvr+6XQzgktkkLdnKFA26blukm9FjmjdVlUno5aGJC3mlP/3UhTLVa7rn
p0y15WTOr5LXsVjuDjXj4NpQT1Y0dljW+EFrv9W0JQsxABdycFJZE/6PBM/am+o0
UIsgAABe+gEDu1kyiVUN0r21xrpZ+ZtlpEM0Yj2AGdFqvY+4lqZqFjOLcYnPRP6j
a2YIoAE6vy18Qai8gg+tQyD8+QaDOw==
=Z7O/
-----END PGP SIGNATURE-----

--5bPp41vj7FCljEleRCYwnRPg2krRgkL93--
