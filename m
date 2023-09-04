Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22857791A04
	for <lists+openbmc@lfdr.de>; Mon,  4 Sep 2023 16:50:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h1+BVSDn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfWlf6jBQz3c4t
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 00:50:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h1+BVSDn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=chandutmba@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfWl13rl2z3c68
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 00:50:05 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-56a55c0f8b1so636650a12.0
        for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2023 07:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693839000; x=1694443800; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQEV1JC9jmXCSUsT/ki4oAo1EuWK+STekp5ZbOx7FBM=;
        b=h1+BVSDnZXR4UJgT2ex9dHkTYnWvGt36PKsfE+sA7chp4j4WLPvovE5sSQLWnEAGJ9
         n1O00ZhKh5JJGMd3huyzFCb0pNTUQxO0XCzHsuAeO1DrOR6JKl5DLNzhCc5eB7S71nPd
         Y5U1bQI3LVWA0hSLYTdw2sh+DDQfK7rnxXbtSciVf6Cse+cWhkPisLdmEKKMNcdZBxkJ
         pXa8nNrYMNN7zl2bxFNSqabolLTjiSNymspjjG+ehnCjz9edzM/ARztIIZEr2T1kZoOS
         ztr4rDfNRGv0V83NcUiZM6GPRizLE1+Q1TXbatxBe37NFS7wWwSo1SRoG8udn0u0ubtt
         ggeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693839000; x=1694443800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQEV1JC9jmXCSUsT/ki4oAo1EuWK+STekp5ZbOx7FBM=;
        b=kw0dBF7USRZKCSARqmhcz1EiwhkKgriizHk8q3HEP1H5d3v54Sk9IIGC8Da5PLI+T7
         zg4vxaFSD8SyF5efQWbwJsTUVwFuAqzXWiAS1rNq3DE0i491pwZJtTAfUUKfXNZWE9bJ
         CBzHfJ0HcPLIWU7yi1077AUKbRaVOynvY2yYrJhEfEJ6gtVo8kz1gR71FjR9x+v++g0N
         65QvaM35GNnlqrNSbThuXf975wK0ogomTKTr///sk4kjkoTq6nO9oQBDOjpJJnqOSJKk
         8mf+JJo0tODt6u29Td23dK6I34EzFSbJzJVUGtipbsMLkPQJYKMnbzQ8poBcjQdO7PwZ
         RbDA==
X-Gm-Message-State: AOJu0Yw/ox0vxOXuYd29Lu9+aqOZJK19cWJ2/k0GaHC9MmIkxE3yFV1n
	HWeuJrM0bpxJVLGjBDXx6Fr4k1gqG0FB8pn2a1TAg8VFX9SRzg==
X-Google-Smtp-Source: AGHT+IG1sRxWIqi9pw44ANjqpjJWybALFr+Et2hZSOt3oHdWZvLmoKILSH4Urktu/j8C/A0L1VlIeuB8DlS5x0SnTng=
X-Received: by 2002:a05:6a21:a103:b0:144:5d5b:8e24 with SMTP id
 aq3-20020a056a21a10300b001445d5b8e24mr7323338pzc.24.1693838999956; Mon, 04
 Sep 2023 07:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY-kLVD7ONa6fkSrQ5sfAxK4UcGZSyHoMr6sb6oQPTafMT_fw@mail.gmail.com>
 <dd842255-9ab0-6fc7-7423-c9420f97dc3c@linux.ibm.com> <CABYu0Wg29+CefRbJg0ep+H6tcO9YZ9OY8Z8vdSUCZuwXgaEEew@mail.gmail.com>
 <CAPY-kLUTFpsjD4=HxoYfE=fedJHeKKOLafp_7_BkJy0wEAFZEg@mail.gmail.com>
 <CAH2-KxDi4pvQ+Y6WJ6_LPRvjQgrxH=tKhe59ODGSeKgU=eVwrA@mail.gmail.com>
 <CAPY-kLX2Vhyva_p6bKe7LGG-2fo0QB=AeeDnipcMAPz18+=Amg@mail.gmail.com> <CAH2-KxCt+hWRBrWJXgJnO1+pUe1io6H3oksQKd9kwZy9ZMtM0Q@mail.gmail.com>
In-Reply-To: <CAH2-KxCt+hWRBrWJXgJnO1+pUe1io6H3oksQKd9kwZy9ZMtM0Q@mail.gmail.com>
From: chandu chanti <chandutmba@gmail.com>
Date: Mon, 4 Sep 2023 20:19:48 +0530
Message-ID: <CAPY-kLVNMFtNYn5ykJqo3iXtmVdK8iMJjvWdxyZ15pE_WoYVuA@mail.gmail.com>
Subject: Re: Error handling
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/related; boundary="000000000000e660e80604899fe0"
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
Cc: Shakeeb Pasha <shakeebbk@gmail.com>, openbmc@lists.ozlabs.org, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e660e80604899fe0
Content-Type: multipart/alternative; boundary="000000000000e660e60604899fdf"

--000000000000e660e60604899fdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

```
+--------------------------------------------------------------------------=
---+
| +-------------+          dbus calls
+-------------------+ | cmd1  +------------------+
| |   BMCWeb    |  <----------------------------------> |   GPU
| | <---->| GPU Out of band  |
| |   Service   |  (xyz.openbmc_project.Memory.Dimm )   |   Manager
| | cmd2  | Server           |
| |             |                                       |  (backend dbus
 | | <---> | (hardware level) |
| |             |                                       |   service)
 | |       |  service)        |
| +-------------+
+-------------------+ |       +------------------+
|                        BMC
   |
+--------------------------------------------------------------------------=
---+

```

Memory URI will use the backend D-Bus interface
"xyz.openbmc_project.Memory.Dimm" hosted by the GPU Manager service to
fetch all memory-related properties.
GPU Manager will update these D-Bus properties by sending SMBus commands to
GPU Out-of-Band server.Intermittent failures can occur in SMBus commands.
At a given instance, there is a chance that cmd1 will fail and cmd2 may
work. we want to use null value for failing property in redfish response
instead of failing entire URI
This is inline with redfish specification
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.18.0=
.pdf
, refer 9.5 Common data types 9.5.1 Primitive types.
This is our use case.


>Please point to a failing branch in code you'd like handled differently.
Again, you've answered in the abstract
>which isn't helping me understand what you're trying to accomplish.

please refer gerrit MR(https://gerrit.openbmc.org/c/openbmc/bmcweb/+/66368)
We are trying to handle errors in memory URI properties. We have a backend
service named GPU Manager Server
that will handle all backend requests related to memory URI. We will use
different SMBus commands to update these properties.
In this particular URI case, the command for serial number may fail, but
SMBus commands for properties like part number and manufacturer will work
at a given time.

if (serialNumber !=3D nullptr)
{
    asyncResp->res.jsonValue[jsonPtr]["SerialNumber"] =3D
          mydatatype_t(*serialNumber);
}

if (partNumber !=3D nullptr)
{
    asyncResp->res.jsonValue[jsonPtr]["PartNumber"] =3D
          mydatatype_t(*partNumber);
}


> If there is an error, the return code should not be 200.  200 OK is
reserved for when there was no error.

Here we are discussing about only one property in dbus interface is
failing. not entire interface.
According to DMTF spec
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.18.0=
.pdf,

9.5 Common data types 9.5.1 Primitive types , please refer Table 17
null value, which the service uses when it is unable to determine the
property's value due to an error or
other temporary condition, or if the schema has requirements for using null
for other special conditions.

we want to use null data type in redfish response to represent error
conditions for specific property.

>This is an example for a double data type.  The other types can be done in
similar manners, if the dbus interface allows it.

we checked for other datatypes, we didn't find any implementation details.
We mentioned the same in our previous mail.

>>2. Using default values in D-Bus properties to indicate errors. Is there
a reference implementation available for setting default values
>>for string and integer data types in bmc web, similar to the
implementation of NaN (default value) for the double data type in
cable.hpp.


>Sorry, but this sounds like you plan on not propagating errors to the
user.
>I can't think of a case where that would be the correct thing to do.
>If the internal service failed, bmcweb should report that to the user
through a return code and error property.

In our case, there is no failure in the entire service, intermittent
failures can occur in smbus commands.
We want to use null value for the corresponding property in redfish
response to represent the error.


On Fri, Sep 1, 2023 at 9:27=E2=80=AFPM Ed Tanous <edtanous@google.com> wrot=
e:

>
>
> On Fri, Sep 1, 2023 at 7:21=E2=80=AFAM chandu chanti <chandutmba@gmail.co=
m> wrote:
>
>>
>> >Overall, I've read the code, and your email, and I really have no idea
>> what's being proposed that doesn't already exist in a much simpler form,
>> >using the existing error handling mechanisms.  While your point that on=
e
>> failing property can fail the whole call is correct,
>> >that's the intent.  If an internal service fails, that needs propagated
>> to the user, in the form of an error code, per the Redfish specification=
.
>>
>> please refer Table 17 =E2=80=94 Primitive data types in
>> https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.1=
8.0.pdf
>> null value, which the service uses when it is unable to determine the
>> property's value due to an error or
>> other temporary condition, or if the schema has requirements for using
>> null for other special conditions.
>>
>>
>> > One thing I don't understand is what code is actually failing in this
>> case?  Can you point to a place where an error is returned that you'd li=
ke
>> >handled differently?
>> > Speaking in concrete terms would help to make the generalized change
>> you're attempting here
>>
>> If there is an error in only one property, we want to represent that a
>> specific property is failing in the URI instead of failing the entire UR=
I.
>>
>
> Please point to a failing branch in code you'd like handled differently.
> Again, you've answered in the abstract which isn't helping me understand
> what you're trying to accomplish.
>
>
>>
>>
>> >Please look at error_messages.hpp and error_messages.cpp
>>
>> We cannot have error messages when the HTTP return code is 200.
>>
>
> If there is an error, the return code should not be 200.  200 OK is
> reserved for when there was no error.
>
>
>>
>>
>> > For properties that have a "null" or "invalid" value, this is already
>> implemented, generally with a simple branch.
>> > Example from sensors:
>> >
>> https://github.com/openbmc/bmcweb/blob/99bf026224d6ea60be27bd36793ddfaea=
5537d2a/redfish-core/lib/sensors.hpp#L934
>>
>> This addresses only the double datatype.
>>
>
> This is an example for a double data type.  The other types can be done i=
n
> similar manners, if the dbus interface allows it.
>
>
>> We are planning to implement it for all data types. Please refer to the
>> following table.
>>
>> >If the dbus data type is incorrect this already sets internal error
>> (500).
>> >Please look at sdbusplus::unpackPropertiesNoThrow usage in bmcweb.
>> >Given that the interface failed, this is the most specific error we can
>> give the user.  We do log the source of the error though.
>>
>> We are considering the case where only one property is failing, not the
>> entire interface. We don't want to fail the entire URI
>> and we had mentioned the same in the very first email.
>>
>
> Sorry, but this sounds like you plan on not propagating errors to the
> user.  I can't think of a case where that would be the correct thing to
> do.  If the internal service failed, bmcweb should report that to the use=
r
> through a return code and error property.
>
>
>>
>> >> 1 . Using exceptions in our backend D-Bus service by throwing
>> exceptions in the D-Bus property get handlers.
>> >>It works fine for the Get property method call. However, when using th=
e
>> Get All method call,
>> >>if one property fails, an error is returned without checking the other
>> properties.
>> >>Is there a way to implement exceptions in GetAll so that even if one
>> property fails, we can still fetch the remaining properties.
>>
>>
>> Error represenation Table for different data types
>> | D-Bus Data Type | Value of the D-Bus Property in case of Error |
>> Property Value as seen on Redfish |
>>
>> |-----------------|---------------------------------------------|-------=
---------------------------|
>> | INT16           | INT_MAX                                     | null
>>                           |
>> | UINT16          | UINT_MAX                                    | null
>>                           |
>> | INT32           | LONG_MAX                                    | null
>>                           |
>> | UINT32          | ULONG_MAX                                   | null
>>                           |
>> | INT64           | LLONG_MAX                                   | null
>>                           |
>> | UINT64          | ULLONG_MAX                                  | null
>>                           |
>> | DOUBLE          | std::numeric_limits<T>::quiet_NaN()        | null
>>                         |
>> | STRING          | BE_ERROR-XXX                                | null
>>                           |
>> | BOOL            | uint8_t {0=E2=80=93false, 1=E2=80=93true, others- er=
ror}    | null
>>                           |
>>
>> On Thu, Aug 31, 2023 at 10:31=E2=80=AFPM Ed Tanous <edtanous@google.com>=
 wrote:
>>
>>>
>>>
>>> On Thu, Aug 31, 2023 at 4:47=E2=80=AFAM chandu chanti <chandutmba@gmail=
.com>
>>> wrote:
>>>
>>>> Hi team,
>>>>
>>>> We have drafted a proposal for  "Using default values in D-Bus
>>>> properties to indicate errors"  as communicated in previous mail.
>>>>
>>>> Issue with Existing Implementation:
>>>> Error handling is not implemented in the existing bmcweb source.
>>>>
>>>
>>> This statement is verifiably incorrect.  Many discussions have been had
>>> about how we handle Dbus, json, and Redfish errors, and the handling
>>> policies are written down in DBUS_USAGE.md.   Please familiarize yourse=
lf
>>> with those previous discussions, and if you believe the conclusion was
>>> incorrect, quote those in your response.
>>>
>>>
>>>> The values fetched from D-Bus are used directly in the Redfish
>>>> response, except for some properties.
>>>>
>>>
>>> While this is true for properties that are intended to be sent directly
>>> to the user, like Asset information, it's not true of all properties.
>>>
>>>
>>>> There was no way to represent error for a given data type on Redfish.
>>>>
>>>
>>> Please look at error_messages.hpp and error_messages.cpp
>>>
>>>
>>>>
>>>>
>>>> New Implementation Proposal:
>>>> We plan to handle errors from backend D-Bus services in bmcweb using a
>>>> custom data type class. We will implement a helper class to create a n=
ew
>>>> data type called mydatatype_t. An object of this class will be created=
 with
>>>> the D-Bus property value as input. This object will be assigned to the=
 JSON
>>>> response using the assignment operator. This assignment operation will
>>>> invoke the to_json function with the mydatatype_t object, where D-Bus
>>>> values will be validated based on their data types.
>>>>
>>>
>>>> Data Types and Default Values:
>>>> The following values will be set on the D-Bus property in case of an
>>>> error, based on the data type.
>>>>
>>>
>>> If the dbus data type is incorrect this already sets internal error
>>> (500).  Please look at sdbusplus::unpackPropertiesNoThrow usage in bmcw=
eb.
>>> Given that the interface failed, this is the most specific error we can
>>> give the user.  We do log the source of the error though.
>>>
>>>
>>>> In Redfish, we will validate these properties. If the D-Bus property
>>>> value matches the error value, we will update the property value as nu=
ll in
>>>> the Redfish JSON response; otherwise, the corresponding value on D-Bus=
 will
>>>> be used.
>>>>
>>>
>>> For properties that have a "null" or "invalid" value, this is already
>>> implemented, generally with a simple branch.
>>> Example from sensors:
>>>
>>> https://github.com/openbmc/bmcweb/blob/99bf026224d6ea60be27bd36793ddfae=
a5537d2a/redfish-core/lib/sensors.hpp#L934
>>>
>>>
>>>
>>>
>>>>
>>>> *D-Bus*
>>>>
>>>> *data type*
>>>>
>>>> *Value of the D-Bus Property incase of Error *
>>>>
>>>> *Property value as seen on Redfish *
>>>>
>>>> INT16
>>>>
>>>> INT_MAX
>>>>
>>>> null
>>>>
>>>> UINT16
>>>>
>>>> UINT_MAX
>>>>
>>>> null
>>>>
>>>> INT32
>>>>
>>>> LONG_MAX
>>>>
>>>> null
>>>>
>>>> UINT32
>>>>
>>>> ULONG_MAX
>>>>
>>>> null
>>>>
>>>> INT64
>>>>
>>>> LLONG_MAX
>>>>
>>>> null
>>>>
>>>> UINT64
>>>>
>>>> ULLONG_MAX
>>>>
>>>> null
>>>>
>>>> DOUBLE
>>>>
>>>> std::numeric_limits
>>>> <http://en.cppreference.com/w/cpp/types/numeric_limits><T>::quiet_NaN(=
)
>>>>
>>>> null
>>>>
>>>> STRING
>>>>
>>>> BE_ERROR-XXX
>>>>
>>>> null
>>>>
>>>> BOOL
>>>>
>>>> uint8_t
>>>> {0=E2=80=93false , 1=E2=80=93true,
>>>>   others- error}
>>>>
>>>> null
>>>>
>>>>
>>> This table does not match with the Redfish spec on error handling
>>> behavior.  Please familiarize yourself with DSP0266
>>> <https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1=
.18.0.pdf>,
>>> and any updates you make, please reference that specification.
>>>
>>> Also, I have no idea what "BE_ERROR-XXX" is supposed to represent.
>>>
>>>
>>>> In case of error conditions Redfish will report "null" for a property
>>>> irrespective  of the data type.
>>>>
>>>> For error validation, we will implement a custom class, which will
>>>> facilitate error validation for D-Bus values. In instances of errors, =
a
>>>> null value will be allocated to the JSON response. Example for the uin=
t16_t
>>>> data type.
>>>>
>>>
>>> As written, this seems considerably worse than what we have today, and
>>> goes backwards on things like:
>>> https://github.com/openbmc/bmcweb/issues/176
>>>
>>>
>>>>
>>>> [image: image.png]
>>>>
>>>> [image: image.png]
>>>>
>>>> For more implementation details please refer the following gerrit link=
,
>>>> we implemented it for redfish URI /redfish/v1/Systems/<str>/Memory/<st=
r>/.
>>>> https://gerrit.openbmc.org/c/openbmc/bmcweb/+/66368
>>>>
>>>> Your feedback and insights are greatly appreciated.
>>>>
>>>> Thanks,
>>>> Chandrasekhar T.
>>>>
>>>
>>>
>>> Overall, I've read the code, and your email, and I really have no idea
>>> what's being proposed that doesn't already exist in a much simpler form=
,
>>> using the existing error handling mechanisms.  While your point that on=
e
>>> failing property can fail the whole call is correct, that's the intent.=
  If
>>> an internal service fails, that needs propagated to the user, in the fo=
rm
>>> of an error code, per the Redfish specification.
>>>
>>> One thing I don't understand is what code is actually failing in this
>>> case?  Can you point to a place where an error is returned that you'd l=
ike
>>> handled differently?  Speaking in concrete terms would help to make the
>>> generalized change you're attempting here.
>>>
>>>
>>>>
>>>> On Fri, Aug 4, 2023 at 12:37=E2=80=AFPM Shakeeb Pasha <shakeebbk@gmail=
.com>
>>>> wrote:
>>>>
>>>>> Thanks Joseph for the response.
>>>>> >> I didn't see anyone else answer this.  Is your question about how =
to
>>>>> >> architect or design your D-Bus interfaces?  Is the reference the
>>>>> BMCWeb
>>>>> >> merely to provide context as a consumer of these D-Bus services?  =
I
>>>>> >> assume so.
>>>>> Question is two pronged, one we wanted to know the best way to
>>>>> propagate error from dbus to bmcweb.
>>>>> Options we tried:
>>>>> 1. Have handlers of each property throw an exception if there was an
>>>>> error. But this did not work well with current bmcweb implementation(=
get
>>>>> all method call), as it would lead to the entire resource not getting
>>>>> populated even if we have one property failing.
>>>>> 2. Implement one additional associated rc property - and do the error
>>>>> handling bmcweb by looking at that, but this doubled up the number of
>>>>> properties on dbus.
>>>>> 3. Use "default values" per property data type, but this would fail
>>>>> for extreme cases like if the property is u32, and if the default val=
ue
>>>>> used was INT_MAX, then it breaks when the property could take value
>>>>> 0xFFFFFFFF as valid value.
>>>>> So the query here was to check if any preference from above options o=
r
>>>>> hear any new approaches as well.
>>>>>
>>>>> The second query was about how to represent this error(per property
>>>>> error) on redfish, our proposal for now is to return "NULL" for any
>>>>> property that might be failing at the backend. Any thoughts on this
>>>>> approach?
>>>>>
>>>>> >> I don't have any special insights.  Are you looking to follow a
>>>>> design
>>>>> >> pattern?  Are you looking for direction from the BMCWeb maintainer=
s?
>>>>>
>>>>> Yes, we are working on a design pattern proposal and will publish it
>>>>> here for review.
>>>>> It would be great if we could get some directions/inputs from the
>>>>> maintainers as well.
>>>>>
>>>>> Thanks,
>>>>> Shakeeb
>>>>>
>>>>> On Thu, Aug 3, 2023 at 10:33=E2=80=AFPM Joseph Reynolds <jrey@linux.i=
bm.com>
>>>>> wrote:
>>>>>
>>>>>> On 7/20/23 2:04 AM, chandu chanti wrote:
>>>>>> > Hi Team, We are planning to handle errors from backend services in
>>>>>> bmc
>>>>>> > web. We are considering the following approaches to implement it,
>>>>>> but
>>>>>> > we are facing some issues. please provide your inputs. 1 . Using
>>>>>> > exceptions in our backend D-Bus service
>>>>>> > ZjQcmQRYFpfptBannerStart
>>>>>> > This Message Is From an Untrusted Sender
>>>>>> > You have not previously corresponded with this sender.
>>>>>> > Report Suspicious
>>>>>> > <
>>>>>> https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJJyaRL1N=
us7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp5Tel83pR4ZZ=
R-wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$>
>>>>>>
>>>>>> >
>>>>>> > ZjQcmQRYFpfptBannerEnd
>>>>>> >
>>>>>> > Hi Team,
>>>>>> >
>>>>>> > We are planning to handle errors from backend services in bmc web.
>>>>>> We
>>>>>> > are considering the following approaches to implement it, but we
>>>>>> are
>>>>>> > facing some issues. please provide your inputs.
>>>>>> >
>>>>>>
>>>>>> I didn't see anyone else answer this.  Is your question about how to
>>>>>> architect or design your D-Bus interfaces?  Is the reference the
>>>>>> BMCWeb
>>>>>> merely to provide context as a consumer of these D-Bus services?  I
>>>>>> assume so.
>>>>>>
>>>>>> I don't have any special insights.  Are you looking to follow a
>>>>>> design
>>>>>> pattern?  Are you looking for direction from the BMCWeb maintainers?
>>>>>>
>>>>>> Joseph
>>>>>>
>>>>>> > 1 . Using exceptions in our backend D-Bus service by throwing
>>>>>> > exceptions in the D-Bus property get handlers. It works fine for
>>>>>> the
>>>>>> > Get property method call. However, when using the Get All method
>>>>>> call,
>>>>>> > if one property fails, an error is returned without checking the
>>>>>> other
>>>>>> > properties. Is there a way to implement exceptions in GetAll so
>>>>>> that
>>>>>> > even if one property fails, we can still fetch the remaining
>>>>>> properties.
>>>>>> >
>>>>>> > 2. Using default values in D-Bus properties to indicate errors. Is
>>>>>> > there a reference implementation available for setting default
>>>>>> values
>>>>>> > for string and integer data types in bmc web, similar to the
>>>>>> > implementation of NaN (default value) for the double data type in
>>>>>> > cable.hpp.
>>>>>> >
>>>>>> > 3. Implement associated return code per property on dbus, but this
>>>>>> > would be very inefficient in terms of double the properties on
>>>>>> dbus,
>>>>>> > something we would like to avoid
>>>>>> >
>>>>>> > Thanks
>>>>>> > Chandrasekhar T.
>>>>>> >
>>>>>>
>>>>>>

--000000000000e660e60604899fdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">```<br>+--------------------------------------------------=
---------------------------+<br>| +-------------+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dbus calls =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 +-------------------+ | cmd1 =C2=A0+------------------+<br>| | =
=C2=A0 BMCWeb =C2=A0 =C2=A0| =C2=A0&lt;----------------------------------&g=
t; | =C2=A0 GPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | &lt;----&gt;|=
 GPU Out of band =C2=A0|<br>| | =C2=A0 Service =C2=A0 | =C2=A0(xyz.openbmc_=
project.Memory.Dimm ) =C2=A0 | =C2=A0 Manager =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 | cmd2 =C2=A0| Server =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0(backend dbus =C2=A0 =C2=A0| | &lt;---&gt; | (=
hardware level) |<br>| | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 service) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| | =C2=A0 =C2=A0 =C2=A0 | =C2=A0service) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0<br>| +-------------+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +-------------------+ | =
=C2=A0 =C2=A0 =C2=A0 +------------------+<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BMC =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|<br>+--------------------------------------------------------=
---------------------+ <br>```<br><br>Memory URI will use the backend D-Bus=
 interface &quot;xyz.openbmc_project.Memory.Dimm&quot; hosted by the GPU Ma=
nager service to fetch all memory-related properties.<br>GPU Manager will u=
pdate these D-Bus properties by sending SMBus commands to GPU Out-of-Band s=
erver.Intermittent failures can occur in SMBus commands.<br>At a given inst=
ance, there is a chance that cmd1 will fail and cmd2 may work. we want to u=
se null value for failing property in redfish response instead of failing e=
ntire URI<br>This is inline with redfish specification <a href=3D"https://w=
ww.dmtf.org/sites/default/files/standards/documents/DSP0266_1.18.0.pdf">htt=
ps://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.18.0.pd=
f</a> , refer 9.5 Common data types 9.5.1 Primitive types.<br>This is our u=
se case.<br><br><br>&gt;Please point to a failing branch in code you&#39;d =
like handled differently.=C2=A0 Again, you&#39;ve answered in the abstract =
<br>&gt;which isn&#39;t helping me understand what you&#39;re trying to acc=
omplish.<br><br>please refer gerrit MR(<a href=3D"https://gerrit.openbmc.or=
g/c/openbmc/bmcweb/+/66368">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/6=
6368</a>)<br>We are trying to handle errors in memory URI properties. We ha=
ve a backend service named GPU Manager Server <br>that will handle all back=
end requests related to memory URI. We will use different SMBus commands to=
 update these properties. <br>In this particular URI case, the command for =
serial number may fail, but SMBus commands for properties like part number =
and manufacturer will work at a given time.<br><br>if (serialNumber !=3D nu=
llptr)<br>{<br>=C2=A0 =C2=A0 asyncResp-&gt;res.jsonValue[jsonPtr][&quot;Ser=
ialNumber&quot;] =3D<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mydatatype_t(*se=
rialNumber);<br>}<br><br>if (partNumber !=3D nullptr)<br>{<br>=C2=A0 =C2=A0=
 asyncResp-&gt;res.jsonValue[jsonPtr][&quot;PartNumber&quot;] =3D<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mydatatype_t(*partNumber);<br>}<br><br><br>&gt=
; If there is an error, the return code should not be 200. =C2=A0200 OK is =
reserved for when there was no error.<br><br>Here we are discussing about o=
nly one property in dbus interface is failing. not entire interface.<br>Acc=
ording to DMTF spec <a href=3D"https://www.dmtf.org/sites/default/files/sta=
ndards/documents/DSP0266_1.18.0.pdf">https://www.dmtf.org/sites/default/fil=
es/standards/documents/DSP0266_1.18.0.pdf</a>, <br>9.5 Common data types 9.=
5.1 Primitive types , please refer Table 17 <br>null value, which the servi=
ce uses when it is unable to determine the property&#39;s value due to an e=
rror or<br>other temporary condition, or if the schema has requirements for=
 using null for other special conditions.<br><br>we want to use null data t=
ype in redfish response to represent error conditions for specific property=
.<br><br>&gt;This is an example for a double data type.=C2=A0 The other typ=
es can be done in similar manners, if the dbus interface allows it.<br><br>=
we checked for other datatypes, we didn&#39;t find any implementation detai=
ls. We mentioned the same in our previous mail.<br><br>&gt;&gt;2. Using def=
ault values in D-Bus properties to indicate errors. Is there a reference im=
plementation available for setting default values <br>&gt;&gt;for string an=
d integer data types in bmc web, similar to the implementation of NaN (defa=
ult value) for the double data type in cable.hpp. <br><br><br>&gt;Sorry, bu=
t this sounds like you plan on not propagating errors to the user. <br>&gt;=
I can&#39;t think of a case where that would be the correct thing to do. =
=C2=A0<br>&gt;If the internal service failed, bmcweb should report that to =
the user through a return code and error property.<br><br>In our case, ther=
e is no failure in the entire service, intermittent failures can occur in s=
mbus commands.<br>We want to use null value for the corresponding property =
in redfish response to represent the error.<br><br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 1, 2023 at 9=
:27=E2=80=AFPM Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com">edtanou=
s@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 1, 2023 at 7:=
21=E2=80=AFAM chandu chanti &lt;<a href=3D"mailto:chandutmba@gmail.com" tar=
get=3D"_blank">chandutmba@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br>&gt;Overall, I&#39;=
ve read the code, and your email, and I really have no idea what&#39;s bein=
g proposed that doesn&#39;t already exist in a much simpler form, <br>&gt;u=
sing the existing error handling mechanisms.=C2=A0 While your point that on=
e failing property can fail the whole call is correct, <br>&gt;that&#39;s t=
he intent.=C2=A0 If an internal service fails, that needs propagated to the=
 user, in the form of an error code, per the Redfish specification.<br><br>=
please refer Table 17 =E2=80=94 Primitive data types in <a href=3D"https://=
www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.18.0.pdf" ta=
rget=3D"_blank">https://www.dmtf.org/sites/default/files/standards/document=
s/DSP0266_1.18.0.pdf</a><br>null value, which the service uses when it is u=
nable to determine the property&#39;s value due to an error or<br>other tem=
porary condition, or if the schema has requirements for using null for othe=
r special conditions.<br><br><br>&gt; One thing I don&#39;t understand is w=
hat code is actually failing in this case?=C2=A0 Can you point to a place w=
here an error is returned that you&#39;d like &gt;handled differently? =C2=
=A0<br>&gt; Speaking in concrete terms would help to make the generalized c=
hange you&#39;re attempting here<br><br>If there is an error in only one pr=
operty, we want to represent that a specific property is failing in the URI=
 instead of failing the entire URI.<br></div></blockquote><div><br></div><d=
iv>Please point to a failing branch in code you&#39;d like handled differen=
tly.=C2=A0 Again, you&#39;ve answered in the abstract which isn&#39;t helpi=
ng me understand what you&#39;re trying to accomplish.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br><b=
r>&gt;Please look at error_messages.hpp and error_messages.cpp<br><br>We ca=
nnot have error messages when the HTTP return code is 200.<br></div></block=
quote><div><br></div><div>If there is an error, the return code should not =
be 200.=C2=A0 200 OK is reserved for when there was no error.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><br><br>&gt; For properties that have a &quot;null&quot; or &quot;invalid&=
quot; value, this is already implemented, generally with a simple branch.<b=
r>&gt; Example from sensors:<br>&gt;<a href=3D"https://github.com/openbmc/b=
mcweb/blob/99bf026224d6ea60be27bd36793ddfaea5537d2a/redfish-core/lib/sensor=
s.hpp#L934" target=3D"_blank">https://github.com/openbmc/bmcweb/blob/99bf02=
6224d6ea60be27bd36793ddfaea5537d2a/redfish-core/lib/sensors.hpp#L934</a><br=
><br>This addresses only the double datatype.</div></blockquote><div><br></=
div><div>This is an example for a double data type.=C2=A0 The other types c=
an be done in similar manners, if the dbus interface allows it.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"> We are planning to implement it for all data types. Please refer to th=
e following table.<br><br>&gt;If the dbus data type is incorrect this alrea=
dy sets internal error (500). =C2=A0<br>&gt;Please look at sdbusplus::unpac=
kPropertiesNoThrow usage in bmcweb. =C2=A0<br>&gt;Given that the interface =
failed, this is the most specific error we can give the user.=C2=A0 We do l=
og the source of the error though.<br><br>We are considering the case where=
 only one property is failing, not the entire interface. We don&#39;t want =
to fail the entire URI <br>and we had mentioned the same in the very first =
email.<br></div></blockquote><div><br></div><div>Sorry, but this sounds lik=
e you plan on not propagating errors to the user.=C2=A0 I can&#39;t think o=
f a case where that would be the correct thing to do.=C2=A0 If the internal=
 service failed, bmcweb should report that to the user through a return cod=
e and error property.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><br>&gt;&gt; 1 . Using exceptions in ou=
r backend D-Bus service by throwing exceptions in the D-Bus property get ha=
ndlers. <br>&gt;&gt;It works fine for the Get property method call. However=
, when using the Get All method call, <br>&gt;&gt;if one property fails, an=
 error is returned without checking the other properties. <br>&gt;&gt;Is th=
ere a way to implement exceptions in GetAll so that even if one property fa=
ils, we can still fetch the remaining properties.<br><br><br>Error represen=
ation Table for different data types<br>| D-Bus Data Type | Value of the D-=
Bus Property in case of Error | Property Value as seen on Redfish |<br>|---=
--------------|---------------------------------------------|--------------=
--------------------|<br>| INT16 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | INT_M=
AX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | null =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |<br>| UINT16 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| UINT_MAX =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| null =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>| INT32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | LONG_MAX =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| null =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |<br>| UINT32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ULONG_MAX =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| I=
NT64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | LLONG_MAX =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| UINT64 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ULLONG_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| DOUBLE =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| std::numeric_limits&lt;T&gt;::quiet_NaN() =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| STRING =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| BE_ERROR-XXX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| null=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| BOOL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| uint8_t {0=E2=80=93false, 1=E2=80=93true, others- error} =C2=A0 =C2=A0=
| null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 31, 2023 at 10:31=E2=80=AF=
PM Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com" target=3D"_blank">e=
dtanous@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 31, 202=
3 at 4:47=E2=80=AFAM chandu chanti &lt;<a href=3D"mailto:chandutmba@gmail.c=
om" target=3D"_blank">chandutmba@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi team,<br><br>=
We have drafted a proposal for=C2=A0 &quot;<span style=3D"font-family:Calib=
ri,sans-serif;font-size:14.6667px">Using default values in D-Bus properties=
 to indicate errors&quot;=C2=A0</span>=C2=A0as=C2=A0<span dir=3D"ltr">commu=
nicated in previous mail.</span><br><br>Issue with Existing Implementation:=
<br>Error handling is not implemented in the existing bmcweb source.</div><=
/blockquote><div><br></div><div>This statement is verifiably incorrect.=C2=
=A0 Many discussions have been had about how we handle Dbus, json, and Redf=
ish errors, and the handling policies are written down in DBUS_USAGE.md.=C2=
=A0 =C2=A0Please familiarize yourself with those previous discussions, and =
if you believe=C2=A0the conclusion was incorrect, quote those in your respo=
nse.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"> The values fetched from D-Bus are used directly in the =
Redfish response, except for some properties.</div></blockquote><div><br></=
div><div>While this is true for properties that are intended to be sent dir=
ectly to the user, like Asset information, it&#39;s not true of all propert=
ies.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"> T<span dir=3D"ltr">here was no way to represent error f=
or a given data type on Redfish.</span></div></blockquote><div><br></div><d=
iv>Please look at error_messages.hpp and error_messages.cpp</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><br><br>New Implementation Proposal:<br>We plan to handle errors from back=
end D-Bus services in bmcweb using a custom data type class. We will implem=
ent a helper class to create a new data type called mydatatype_t. An object=
 of this class will be created with the D-Bus property value as input. This=
 object will be assigned to the JSON response using the assignment operator=
. This assignment operation will invoke the to_json function with the mydat=
atype_t object, where D-Bus values will be validated based on their data ty=
pes.=C2=A0</div></blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><br>Data Types and Default Values:<br>The following va=
lues will be set on the D-Bus property in case of an error, based on the da=
ta type.</div></blockquote><div><br></div><div>If the dbus data type is inc=
orrect this already sets internal error (500).=C2=A0 Please look at=C2=A0sd=
busplus::unpackPropertiesNoThrow usage in bmcweb.=C2=A0 Given that the inte=
rface failed, this is the most specific error we can give the user.=C2=A0 W=
e do log the source of the error though.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"> In Redfish, we will=
 validate these properties. If the D-Bus property value matches the error v=
alue, we will update the property value as null in the Redfish JSON respons=
e; otherwise, the corresponding value on D-Bus will be used.<br></div></blo=
ckquote><div><br></div><div>For properties that have a &quot;null&quot; or =
&quot;invalid&quot; value, this is already implemented, generally with a si=
mple branch.</div><div>Example from sensors:<br><a href=3D"https://github.c=
om/openbmc/bmcweb/blob/99bf026224d6ea60be27bd36793ddfaea5537d2a/redfish-cor=
e/lib/sensors.hpp#L934" target=3D"_blank">https://github.com/openbmc/bmcweb=
/blob/99bf026224d6ea60be27bd36793ddfaea5537d2a/redfish-core/lib/sensors.hpp=
#L934</a><br></div><div><br></div><div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br><table border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"border-collapse:collaps=
e">
 <thead>
  <tr>
   <td valign=3D"top" style=3D"border:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
b><span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:b=
lack">D-Bus</span></b><b><span style=3D"font-size:12pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"></span></b></p>
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
b><span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:b=
lack">data type</span></b><b><span style=3D"font-size:12pt;font-family:&quo=
t;Times New Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:1pt solid black;border-right:1pt =
solid black;border-bottom:1pt solid black;border-left:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
b><span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:b=
lack">Value of the D-Bus Property incase of Error=C2=A0</span></b><b><span =
style=3D"font-size:12pt;font-family:&quot;Times New Roman&quot;,serif"></sp=
an></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:1pt solid black;border-right:1pt =
solid black;border-bottom:1pt solid black;border-left:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
b><span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:b=
lack">Property value as seen on
   Redfish </span></b><b><span style=3D"font-size:12pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"></span></b></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">INT16</span><b><span style=3D"font-size:12pt;font-family:&quot;Times New=
 Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k;background-image:initial;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial">INT_MAX</span><b><span style=3D"font-size:12pt;font-family:&quot;Time=
s New Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">null</span></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">UINT16</span><b><span style=3D"font-size:12pt;font-family:&quot;Times Ne=
w Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k;background-image:initial;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial">UINT_MAX</span><b><span style=3D"font-size:12pt;font-family:&quot;Tim=
es New Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:13.3333px">null</span><br></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">INT32</span><b><span style=3D"font-size:12pt;font-family:&quot;Times New=
 Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k;background-image:initial;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial">LONG_MAX</span><b><span style=3D"font-size:12pt;font-family:&quot;Tim=
es New Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:13.3333px">null</span><br></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">UINT32</span><b><span style=3D"font-size:12pt;font-family:&quot;Times Ne=
w Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k;background-image:initial;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial">ULONG_MAX</span><b><span style=3D"font-size:12pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:13.3333px">null</span><br></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">INT64</span><b><span style=3D"font-size:12pt;font-family:&quot;Times New=
 Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k;background-image:initial;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial">LLONG_MAX</span><b><span style=3D"font-size:12pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:13.3333px">null</span><br></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">UINT64</span><b><span style=3D"font-size:12pt;font-family:&quot;Times Ne=
w Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k;background-image:initial;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial">ULLONG_MAX</span><b><span style=3D"font-size:12pt;font-family:&quot;T=
imes New Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:13.3333px">null</span><br></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">DOUBLE</span><b><span style=3D"font-size:12pt;font-family:&quot;Times Ne=
w Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
a href=3D"http://en.cppreference.com/w/cpp/types/numeric_limits" target=3D"=
_blank"><span style=3D"font-size:9pt;font-family:&quot;Courier New&quot;;co=
lor:black">std::numeric_limits</span></a><span style=3D"font-size:9pt;font-=
family:&quot;Courier New&quot;;color:black">&lt;T&gt;::quiet_NaN()</span><b=
><span style=3D"font-size:12pt;font-family:&quot;Times New Roman&quot;,seri=
f"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:13.3333px">null</span><br></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">STRING</span><b><span style=3D"font-size:12pt;font-family:&quot;Times Ne=
w Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k;background-image:initial;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial">BE_ERROR-XXX</span><span style=3D"font-size:12pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"></span></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:13.3333px">null</span><br></p>
   </td>
  </tr>
  <tr>
   <td valign=3D"top" style=3D"border-right:1pt solid black;border-bottom:1=
pt solid black;border-left:1pt solid black;border-top:none;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k">BOOL</span><b><span style=3D"font-size:12pt;font-family:&quot;Times New =
Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"font-size:10pt;font-family:&quot;Courier New&quot;;color:blac=
k;background-image:initial;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial">uint8_t
   <br>
   {0=E2=80=93false , 1=E2=80=93true, <br>
   =C2=A0 others- error}</span><b><span style=3D"font-size:12pt;font-family=
:&quot;Times New Roman&quot;,serif"></span></b></p>
   </td>
   <td valign=3D"top" style=3D"border-top:none;border-left:none;border-bott=
om:1pt solid black;border-right:1pt solid black;padding:5pt">
   <p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in;text-align:c=
enter;line-height:normal;font-size:10.5pt;font-family:Calibri,sans-serif"><=
span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-siz=
e:13.3333px">null</span><br></p>
   </td>
  </tr>
 </thead>
</table><br><span dir=3D"ltr"></span></div></blockquote><div><br></div><div=
>This table does not match with the Redfish spec on error handling behavior=
.=C2=A0 Please familiarize=C2=A0yourself with=C2=A0<a href=3D"https://www.d=
mtf.org/sites/default/files/standards/documents/DSP0266_1.18.0.pdf" style=
=3D"box-sizing:border-box;color:rgb(0,102,179);text-decoration-line:none;fo=
nt-family:&quot;Helvetica Neue&quot;,Arial,Helvetica,sans-serif;font-size:1=
3.6px" target=3D"_blank">DSP0266</a>, and any updates you make, please refe=
rence that specification.</div><div><br></div><div>Also, I have no idea wha=
t &quot;BE_ERROR-XXX&quot; is supposed to represent.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><span di=
r=3D"ltr">In case of error conditions Redfish will report &quot;null&quot; =
for a property irrespective =C2=A0of the data type.</span><br><br><div>For =
error validation, we will implement a custom class, which will facilitate e=
rror validation for D-Bus values. In instances of errors, a null value will=
 be allocated to the JSON response. Example for the uint16_t data type.<br>=
</div></div></blockquote><div><br></div><div>As written, this seems conside=
rably worse than what we have today, and goes backwards on things like:=C2=
=A0<a href=3D"https://github.com/openbmc/bmcweb/issues/176" target=3D"_blan=
k">https://github.com/openbmc/bmcweb/issues/176</a></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></di=
v><div><br></div><div><img src=3D"cid:ii_llz2xobr2" alt=3D"image.png" width=
=3D"188" height=3D"17" style=3D"margin-right: 0px;"><br></div><div><br><img=
 src=3D"cid:ii_llz2fns20" alt=3D"image.png" style=3D"margin-right: 0px;" wi=
dth=3D"472" height=3D"34"><br><br>For more implementation details please re=
fer the following gerrit link, we implemented it for redfish URI /redfish/v=
1/Systems/&lt;str&gt;/Memory/&lt;str&gt;/.<div><a href=3D"https://gerrit.op=
enbmc.org/c/openbmc/bmcweb/+/66368" target=3D"_blank">https://gerrit.openbm=
c.org/c/openbmc/bmcweb/+/66368</a><br><br>Your feedback and insights are gr=
eatly appreciated.<br><br>Thanks,<br>Chandrasekhar T.<br></div></div></div>=
</blockquote><div><br></div><div><br></div><div>Overall, I&#39;ve read the =
code, and your email, and I really have no idea what&#39;s being proposed t=
hat doesn&#39;t already exist in a much simpler form, using the existing er=
ror handling mechanisms.=C2=A0 While your point that one failing property c=
an fail the whole call is correct, that&#39;s the intent.=C2=A0 If an inter=
nal service fails, that needs propagated=C2=A0to the user, in the form of a=
n error code, per the Redfish specification.</div><div><br></div><div>One t=
hing I don&#39;t understand is what code is actually failing in this case?=
=C2=A0 Can you point to a place where an error is returned that you&#39;d l=
ike handled differently?=C2=A0 Speaking in concrete terms would help to mak=
e the generalized change you&#39;re attempting here.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><di=
v></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 4, 2023 at 12:37=E2=80=AFPM Shakeeb Pasha &lt;<=
a href=3D"mailto:shakeebbk@gmail.com" target=3D"_blank">shakeebbk@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:large">Thanks=C2=
=A0Joseph for the response.</div><div style=3D"font-size:large"><span style=
=3D"font-size:small">&gt;&gt; I didn&#39;t see anyone else answer this.=C2=
=A0 Is your question about how to</span><br style=3D"font-size:small"><span=
 style=3D"font-size:small">&gt;&gt; architect or design your D-Bus interfac=
es?=C2=A0 Is the reference the BMCWeb</span><br style=3D"font-size:small"><=
span style=3D"font-size:small">&gt;&gt; merely to provide context as a cons=
umer of these D-Bus services?=C2=A0 I</span><br style=3D"font-size:small"><=
span style=3D"font-size:small">&gt;&gt; assume so.</span><br style=3D"font-=
size:small">Question is two pronged, one we wanted to know the=C2=A0best wa=
y to propagate=C2=A0error from dbus to bmcweb.</div><div><font size=3D"4">O=
ptions we tried:</font></div><div><font size=3D"4">1. Have handlers of each=
 property throw an exception if there was an error. But this did not work w=
ell with current bmcweb implementation(get all method call), as it would le=
ad to the entire resource=C2=A0not getting populated even if we have one pr=
operty failing.</font></div><div><font size=3D"4">2. Implement one addition=
al associated rc property - and do the error handling bmcweb by looking at =
that, but this doubled up the number of properties on dbus.</font></div><di=
v><font size=3D"4">3. Use &quot;default values&quot; per property data type=
, but this would fail for extreme cases like if the property=C2=A0is u32, a=
nd if the default value used was INT_MAX, then it breaks when the property =
could take value 0xFFFFFFFF as valid value.</font></div><div><font size=3D"=
4">So the query here was to check if any preference from above options or h=
ear any new approaches as well.</font></div><div><font size=3D"4"><br></fon=
t></div><div><font size=3D"4">The second query was about how to represent t=
his error(per property error) on redfish, our proposal for now is to return=
 &quot;NULL&quot; for any property that might be failing at the backend. An=
y thoughts on this approach?</font></div><div><font size=3D"4"><br></font><=
span style=3D"font-size:small">&gt;&gt; I don&#39;t have any special insigh=
ts.=C2=A0 Are you looking to follow a design</span><br style=3D"font-size:s=
mall"><span style=3D"font-size:small">&gt;&gt; pattern?=C2=A0 Are you looki=
ng for direction from the BMCWeb maintainers?</span><br></div><div><span st=
yle=3D"font-size:small"><br></span></div><div style=3D"font-size:large">Yes=
, we are working on a design pattern proposal and will publish it here for =
review.</div><div style=3D"font-size:large">It would be great if we could g=
et some directions/inputs from the maintainers as well.</div><div style=3D"=
font-size:large"><br></div><div style=3D"font-size:large">Thanks,</div><div=
 style=3D"font-size:large">Shakeeb</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 3, 2023 at 10:33=E2=80=
=AFPM Joseph Reynolds &lt;<a href=3D"mailto:jrey@linux.ibm.com" target=3D"_=
blank">jrey@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 7/20/23 2:04 AM, chandu chanti wrote:<br>
&gt; Hi Team, We are planning to handle errors from backend services in bmc=
 <br>
&gt; web. We are considering the following approaches to implement it, but =
<br>
&gt; we are facing some issues. please provide your inputs. 1 .=C2=A0Using =
<br>
&gt; exceptions in our backend D-Bus service<br>
&gt; ZjQcmQRYFpfptBannerStart<br>
&gt; This Message Is From an Untrusted Sender<br>
&gt; You have not previously corresponded with this sender.<br>
&gt; Report=C2=A0Suspicious<br>
&gt; &lt;<a href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!=
12-vrJJyaRL1Nus7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0w=
xp5Tel83pR4ZZR-wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$" rel=3D"noreferrer" targe=
t=3D"_blank">https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJJ=
yaRL1Nus7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp5Tel8=
3pR4ZZR-wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$</a>&gt; <br>
&gt;<br>
&gt; ZjQcmQRYFpfptBannerEnd<br>
&gt;<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; We are planning to handle errors from backend services in bmc web. We =
<br>
&gt; are considering the following approaches to implement it, but we are <=
br>
&gt; facing some issues. please provide your inputs.<br>
&gt;<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:large"></span>I didn&#39;t=
 see anyone else answer this.=C2=A0 Is your question about how to <br>
architect or design your D-Bus interfaces?=C2=A0 Is the reference the BMCWe=
b <br>
merely to provide context as a consumer of these D-Bus services?=C2=A0 I <b=
r>
assume so.<br>
<br>
I don&#39;t have any special insights.=C2=A0 Are you looking to follow a de=
sign <br>
pattern?=C2=A0 Are you looking for direction from the BMCWeb maintainers?<b=
r>
<br>
Joseph<br>
<br>
&gt; 1 .=C2=A0Using exceptions in our backend D-Bus service by throwing <br=
>
&gt; exceptions in the D-Bus property get handlers. It works fine for the <=
br>
&gt; Get property method call. However, when using the Get All method call,=
 <br>
&gt; if one property fails, an error is returned without checking the other=
 <br>
&gt; properties. Is there a way to implement exceptions in GetAll so that <=
br>
&gt; even if one property fails, we can still fetch the remaining propertie=
s.<br>
&gt;<br>
&gt; 2. Using default values in D-Bus properties to indicate errors. Is <br=
>
&gt; there a reference implementation available for setting default values =
<br>
&gt; for string and integer data types in bmc web, similar to the <br>
&gt; implementation of NaN (default value) for the double data type in <br>
&gt; cable.hpp.<br>
&gt;<br>
&gt; 3. Implement associated return code per property on dbus, but this <br=
>
&gt; would be very inefficient in terms of double the properties on dbus, <=
br>
&gt; something we would like to avoid<br>
&gt;<br>
&gt; Thanks<br>
&gt; Chandrasekhar T.<br>
&gt;<br>
<br>
</blockquote></div></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>

--000000000000e660e60604899fdf--

--000000000000e660e80604899fe0
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_llz2fns20>
X-Attachment-Id: ii_llz2fns20

iVBORw0KGgoAAAANSUhEUgAABy8AAACGCAYAAABkD8YJAAAgAElEQVR4Aey9/1cU593/77+QX3ry
6+T0faDY3FrvvJO3PY25kzukR8OxaTja+zaxdgueLk2VGppoTEATBZtgbVVsoCQhgtqsWs0GUvFb
QBIXqyx+JMRiiLFZTbRg0FWRVZHn51xzXTNzzezMMIsLu8iLczj77Zrrel2P65rZa1/Peb2uSaA/
IkAEiAARIAJEgAgQASJABIgAESACRIAIpIBA7MZN0L/BIAVDQE0SASJABIgAESACRIAIEIG0IzAp
7Swig4gAESACRIAIEAEiQASIABEgAkSACBCBCUGAhEtDuGQs6I8IEAEiQASIABEgAkSACBABgMRL
mgVEgAgQASJABIgAESACRIAIEAEiQASIQEoIkHhJ4mVKJh41SgSIABEgAkSACBABIpDWBEi8TOvh
IeOIABEgAkSACBABIkAEiAARIAJEgAjcvQRIvCTx8u6d3dQzIkAEiAARIAJEgAgQgZESIPFypOTo
OCJABIgAESACRIAIEAEiQASIABEgAkTgjgiQeEni5R1NIDqYCBABIkAEiAARIAJE4K4kQOLlXTms
1CkiQASIABEgAkSACBABIkAEiAARIALpT4DESxIv03+WkoVEgAgQASJABIgAESACY02AxMuxJk7t
EQEiQASIABEgAkSACBABIkAEiAARIAIqARIvSbykU4EIEAEiQASIABEgAkSACFgJkHhpJUKviQAR
IAJEgAgQASJABIgAESACRIAIEIExIUDiJYmXYzLRqBEiQASIABEgAkSACBCBcUVgYouXgz3o6RtX
40XGEgEiMAEJxPqiE7DX1GUiQASIABEgAkSACBCBiUCAxEsSL0djnsd6ehAbjYqpTiJABIhAsggM
RhEld0+yaFI9RIAI3IUE0l68vPRxHXZ8vwDvTBL/3y3D0TNJGIn+TlTMycS8v0aSUBlVkVICx0qh
KIrp37ejJ6UmqY0Lu0qPjcyU8BrWp1KER3b4BDuqF4FfVOG+e+T/erTbUfj6E/zSVK4K973xT7uS
afJeFE0vZSJ7TZh+fKfJiJAZRIAIEAEiQASIABEgAskjQOLlBBUvr55G6wtLDV/PpAJsLjuOwSRM
rciHS5E9uRQhUi+TQDOFVZwPwGfx9Shr0sFD0oOAT4HiC2AknqeeHT4oig+B8ylkO56aPlZv8fVU
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
euhLcTTPK6r7LiGQHuJlDE0rc1DaRD9B75JpRd0gAkSACBABIkAEiAARkAiko4CYSpskNPR0pATO
NmLpk6UITxC/R3gd25NzCnJfCaCb0k6OdNbQcROJQLqIl1/UYt5ztXTeTqS5R30lAkQgIQITWLwU
nCbIYjahWUGFiQARSC8CdJ1Kr/Ega4gAESACRIAIEAEiQASSRiCVQmE6tp00sBO9IvoNNdFnAPWf
CIwPAnStGh/jRFYSASKQEgIkXqYEOzVKBIgAESACRIAIEAEiQASIABEgAkSACKSjgJhKm2hGEAEi
QASIABEgAkSACBABIgCQeEmzgAgQASJABIgAESACRIAIEAEiQASIABFICYFUCoXp2HZKBoEaJQJE
gAgQASJABIgAESACaUaAxMs0GxAyhwgQASJABIgAESACRIAIEAEiQASIwEQhkI4CYiptmijjTv0k
AkSACBABIkAEiAARIAJuBEi8dKNDnxEBIkAEiAARIAJEgAgQASJABIgAESACo0YglUJhOrY9aqCp
YiJABIgAESACRIAIEAEiMI4IpE68HIwiXDUPUxQfAufHETEylQgQASJABIgAESACRIAIEAEiQASI
ABFICoF0FBBTaVNSoKa4kmh7NeZNU+Db0ZNiS6h5IkAEiAARIAJEgAgQgfFKIGXiZc8uHzKVbJR8
0I3o4HjFR3YTASJABIgAESACRIAIEAEiQASIABEgAiMlkEqhMB3bHinHtDnufBC+yQqyVwbR3Zc2
VpEhRIAIEAEiQASIABEgAuOMQIrEy05UPKwgc014nOEic4kAESACRIAIEAEiQASIABEgAkSACBCB
ZBFIhYB4smYJFuT58er7ZxHX/sB5tG1+Hct+7VfLLPAvQdmmRnzeezO+7DetCKx5GQULWdlFWPTa
m2g53R9f7obNsQ7vJYtrqurp/PMMKJNLEaab1FM1BNQuESACRIAIEAEiQATuCgKpES/PB+BTKIXI
XTGDqBNEgAgQASJABIgAESACRIAIEAEiQARGSCBOPHQQ9ZJW7sxuvJrHhcl48TKKE5uYsLkIxW81
ou1wK1refxPFTJws3IyTA5IIeekYagrZ+6sR2NOKtoP1+MsyPxYsXI3GM1K5BPszQoxpclgPAj4F
ii8AShibJkNCZhABIkAEiAARIAJEYJwSIPFynA4cmU0EiAARIAJEgAgQASJABIgAESACRGC8E0ia
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
mTwNs54vQ+DflrnhJF4OOYgSt9qwu86HWdO5/+L+x1lKSfv2uzww6BLtzN22G4H1GtsMTJuzGOu7
OkbspG87+g7qum24OjmyxT6Kc7c3o/VwGXwaNyUDRYctdiTAoKOrEkX+R9TINbbumDbHh7LDrSPu
l3q+2aT6dXSW32pFoNIYL2XaI84pgdX5PRfT2LxztDWRediAlQ8rUF6pM8/Po0XIUDKwuMXCNZHz
Sx9Hh3kqPlfFL6UIu/XyfP63bp8LRbER7S/vRvnzswSD+/GIvwiVjvPQvW3j2ijKyb4RpzSnKR0v
l/50lyNbUVB0VOZn4+cRfdTK6QwSOb+ksUqmeKnbItUf956TeCki7/Q9M4e6oKahZWlFVWFRuq46
iX5XvkX1q7fxxHe5T2Tq92/jV+ujfA9OYVM4eAtZk25iB3t99Aam3juEJ6Zq0Y9coJOFVR75KG+9
Y2OP3t8zOPThDcz/Pi//f2feRMXJK5Y9L0V0p+wzMT3XokB5f/XIyyvfouKFIfxfVvZe4Kcv9OPA
FYnJkLO4qNeh26mlox2+X3wM5HLm5/F7VF7AjvW38FPBIOu7Q/C9es1iq2x3os/5OeR4PZb6GDf3
6LM7+1504Efipd0Pt8+2wZelIPOpYgR2sdRh9ahdMlONINPuYtcdAMcqMS9LwZT/KUdQTce6DRVq
6sUMFL5n7B0X3cpSkWWgpMEs7qBXONmkSCfuVHoMOT9+APN+v01NadZUU4xcJqRK5VQbLnyKwM+Z
QDQTSyvr1bLB3/NUsNmrm01Oxzhnldb3FrYXkmKyFx01FgZavx5DxWHDichsiDUsxRQlAzlLKtHE
GOyqxNIfs0WwuSxvPwOZU3+C0hpmq8ZVgdVWna9mo8sjd95l4MGfFyNwQBaNzXZqdfLyjyH70Qzk
Lq/hNrMUuu+ZnbSxA8XqF3v2LzfwsdX6lVWARtN+axcQWvofpjFoqvwtcth4PTqyvR41W2MdzUZK
OzWdnYN46XEesnojNc+qc1kfr63lmMcczI8WIyyJrYnNQ+4ozTTtR8jfU35Xb5qHSOT8ksad25MM
8fICwiWPqfPTv06cX2K8Mn+1Mz71LbNBOGHtxD5trNhjKsdLEy+zfzwTD2rXI5YK9il2Lv4Etcel
88GxPxfQtIg5o1cjrLL/Ct2mPUct6RQ/+tQ8trozffjzS+am2e7Od2zEyyvv3lZTXmw7qvEyhDuT
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
--000000000000e660e80604899fe0
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_llz2xobr2>
X-Attachment-Id: ii_llz2xobr2

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
--000000000000e660e80604899fe0--
