Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1278FF01
	for <lists+openbmc@lfdr.de>; Fri,  1 Sep 2023 16:26:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KCVrVetn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcgLv4ffZz3c2V
	for <lists+openbmc@lfdr.de>; Sat,  2 Sep 2023 00:26:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KCVrVetn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=chandutmba@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcgLJ0Mc0z2xdR
	for <openbmc@lists.ozlabs.org>; Sat,  2 Sep 2023 00:25:43 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-565e395e7a6so1278094a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 01 Sep 2023 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693578341; x=1694183141; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1YmT1h+t9abcJsot7c3xQw8pqD2+wn8XLtBx5lueqKY=;
        b=KCVrVetnBD4Lc9eoXeu/8dttVjdfT9c0g/5CIHtzlKddRw8MD1RsOubXYtQMpaPldT
         LGaoV7iDGrnIeN64r5FL63+qw/TVJViXBTKPjNcWZFDeBSlJPgpIUQvnxqUplsx/jN+X
         jXxCUp6kYHJ9LmuOlb+CYRd7TxQ1vliCBbaafkaxcY8tMYuryg+cBp1j/HREpsYINwTy
         30pRhQEkjhAqGWUvhtDSAnEKPsSm7/zzVcv3v0cSJZa+4Pqjp4vLkfw3j/Vj61tFY21x
         Rob1V6Ky3qCOJExwxEZxR9Vjae1x0jF++CkdlcTdtzqhUXYathmXPij+SLROMtGxRQMn
         fHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693578341; x=1694183141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YmT1h+t9abcJsot7c3xQw8pqD2+wn8XLtBx5lueqKY=;
        b=ASu9CuT5XaZ/+JE16CpFYSbXPBBdmV91SCfTyK7KMpIx3z0dOB8SflI9dIG0wVSOBO
         Q3IRfwwQx6GONgvObhnhcLP6thbsY8a0AMBhbmOUHMPudC5T4vDxCBbZP5o/9+v64rnA
         l8ZH5VTvMMP9OYONHbJRS9DKpZaE9sIKMNWtJgq2ntdBCs22I+LsXwsM3dNVK+ZBEfG8
         Py2ddPpDkAKRSsEYClCjkNUW7ouVIXlApQnwWJDOPys2gvfTmN7b9TBLOlYCjMfo/YHZ
         jUKAnlp0wzZMASczimhbX86oUZl2jOdycA3Qm9KLTHfCV9KIvjjFAhE2poqnuY89B0GO
         PgGw==
X-Gm-Message-State: AOJu0YxtJkMVNFLTsWlDGivU3WowCbrRGfwZT1ZZutdYO1PqzB+/fD9+
	4b8rF6JYTn3K/MMWqSTHS9m/hV+DQQrS4jyJQD3cQRojjIv1uAa8
X-Google-Smtp-Source: AGHT+IFGzv915+V9RQWsl0yUzwVIhUaF66nG8sGQIAqZ7474TEvxSaYtzhNJ3zd191e4w2TO8iZhhpbgZxF4LZR5PGo=
X-Received: by 2002:a17:90b:a08:b0:269:60ed:d495 with SMTP id
 gg8-20020a17090b0a0800b0026960edd495mr2259097pjb.27.1693578340967; Fri, 01
 Sep 2023 07:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY-kLVD7ONa6fkSrQ5sfAxK4UcGZSyHoMr6sb6oQPTafMT_fw@mail.gmail.com>
 <dd842255-9ab0-6fc7-7423-c9420f97dc3c@linux.ibm.com> <CABYu0Wg29+CefRbJg0ep+H6tcO9YZ9OY8Z8vdSUCZuwXgaEEew@mail.gmail.com>
 <CAPY-kLUTFpsjD4=HxoYfE=fedJHeKKOLafp_7_BkJy0wEAFZEg@mail.gmail.com> <ZPCxsnrNsNDFazBl@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZPCxsnrNsNDFazBl@heinlein.vulture-banana.ts.net>
From: chandu chanti <chandutmba@gmail.com>
Date: Fri, 1 Sep 2023 19:55:28 +0530
Message-ID: <CAPY-kLVAtihQXiL-2gTgSGU6BHYfRUfbCbJf-XjqmEVwwsLeUQ@mail.gmail.com>
Subject: Re: Error handling
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000069aaaf06044cef8a"
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

--00000000000069aaaf06044cef8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>I don't understand the proposal. Is this something contained within
bmcweb, or does it affect other repositories?
>Does it also affect sdbusplus, or is it limited to the backend
applications?
>I am unable to interpret your writing in terms of dbus property and/or
method behaviors.

yes We require changes in the backend dbus service; sdbusplus changes are
not required.

Implementation details for the backend dbus service are as follows:

All dbus properties will use the values mentioned in the table as
representations of error values.
For string data types, we will use the predefined value "BE_ERROR-XXX=E2=80=
=9D to
indicate error conditions.
For double data types, we will use "nan" to represent error conditions.
For all integer data types, we will use the corresponding MAX values based
on the data type.

>Regarding the content below, is it intended to be presented as a table?
>I'm having trouble understanding what this extensive list of types and
values is meant to convey.

Yes, it's a table. There seems to be an issue with formatting. We have
organized all data types in a table.
Error represenation Table for different data types
| D-Bus Data Type | Value of the D-Bus Property in case of Error | Property
Value as seen on Redfish |
|-----------------|---------------------------------------------|----------=
------------------------|
| INT16           | INT_MAX                                     | null
                        |
| UINT16          | UINT_MAX                                    | null
                        |
| INT32           | LONG_MAX                                    | null
                        |
| UINT32          | ULONG_MAX                                   | null
                        |
| INT64           | LLONG_MAX                                   | null
                        |
| UINT64          | ULLONG_MAX                                  | null
                        |
| DOUBLE          | std::numeric_limits<T>::quiet_NaN()        | null
                      |
| STRING          | BE_ERROR-XXX                                | null
                        |
| BOOL            | uint8_t {0=E2=80=93false, 1=E2=80=93true, others- error=
}    | null
                        |

On Thu, Aug 31, 2023 at 8:58=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:

> On Thu, Aug 31, 2023 at 05:16:50PM +0530, chandu chanti wrote:
> > Hi team,
> >
> > We have drafted a proposal for  "Using default values in D-Bus properti=
es
> > to indicate errors"  as communicated in previous mail.
> >
> > Issue with Existing Implementation:
> > Error handling is not implemented in the existing bmcweb source. The
> values
> > fetched from D-Bus are used directly in the Redfish response, except fo=
r
> > some properties. There was no way to represent error for a given data
> type
> > on Redfish.
> >
> > New Implementation Proposal:
> > We plan to handle errors from backend D-Bus services in bmcweb using a
> > custom data type class. We will implement a helper class to create a ne=
w
> > data type called mydatatype_t. An object of this class will be created
> with
> > the D-Bus property value as input. This object will be assigned to the
> JSON
> > response using the assignment operator. This assignment operation will
> > invoke the to_json function with the mydatatype_t object, where D-Bus
> > values will be validated based on their data types.
>
> I don't understand the proposal.  Is this something contained to bmcweb,
> or does it affect other repos?  sdbusplus also, or just the backend
> applications?  I am unable to translate what you've written to dbus
> property
> and/or method behaviors.
>
> >
> > Data Types and Default Values:
> > The following values will be set on the D-Bus property in case of an
> error,
> > based on the data type. In Redfish, we will validate these properties. =
If
> > the D-Bus property value matches the error value, we will update the
> > property value as null in the Redfish JSON response; otherwise, the
> > corresponding value on D-Bus will be used.
> >
>
> Is the below intended to be a table?  I can't figure out what this long
> list of types and values is suppose to be.
>
> > *D-Bus*
> >
> > *data type*
> >
> > *Value of the D-Bus Property incase of Error *
> >
> > *Property value as seen on Redfish *
> >
> > INT16
> >
> > INT_MAX
> >
> > null
> >
> > UINT16
> >
> > UINT_MAX
> >
> > null
> >
> > INT32
> >
> > LONG_MAX
> >
> > null
> >
> > UINT32
> >
> > ULONG_MAX
> >
> > null
> >
> > INT64
> >
> > LLONG_MAX
> >
> > null
> >
> > UINT64
> >
> > ULLONG_MAX
> >
> > null
> >
> > DOUBLE
> >
> > std::numeric_limits <
> http://en.cppreference.com/w/cpp/types/numeric_limits>
> > <T>::quiet_NaN()
> >
> > null
> >
> > STRING
> >
> > BE_ERROR-XXX
> >
> > null
> >
> > BOOL
> >
> > uint8_t
> > {0=E2=80=93false , 1=E2=80=93true,
> >   others- error}
> >
> > null
> >
> > In case of error conditions Redfish will report "null" for a property
> > irrespective  of the data type.
> >
> > For error validation, we will implement a custom class, which will
> > facilitate error validation for D-Bus values. In instances of errors, a
> > null value will be allocated to the JSON response. Example for the
> uint16_t
> > data type.
> >
> > [image: image.png]
> >
> > [image: image.png]
> >
> > For more implementation details please refer the following gerrit link,
> we
> > implemented it for redfish URI /redfish/v1/Systems/<str>/Memory/<str>/.
> > https://gerrit.openbmc.org/c/openbmc/bmcweb/+/66368
> >
> > Your feedback and insights are greatly appreciated.
> >
> > Thanks,
> > Chandrasekhar T.
> >
> > On Fri, Aug 4, 2023 at 12:37=E2=80=AFPM Shakeeb Pasha <shakeebbk@gmail.=
com>
> wrote:
> >
> > > Thanks Joseph for the response.
> > > >> I didn't see anyone else answer this.  Is your question about how =
to
> > > >> architect or design your D-Bus interfaces?  Is the reference the
> BMCWeb
> > > >> merely to provide context as a consumer of these D-Bus services?  =
I
> > > >> assume so.
> > > Question is two pronged, one we wanted to know the best way to
> > > propagate error from dbus to bmcweb.
> > > Options we tried:
> > > 1. Have handlers of each property throw an exception if there was an
> > > error. But this did not work well with current bmcweb
> implementation(get
> > > all method call), as it would lead to the entire resource not getting
> > > populated even if we have one property failing.
> > > 2. Implement one additional associated rc property - and do the error
> > > handling bmcweb by looking at that, but this doubled up the number of
> > > properties on dbus.
> > > 3. Use "default values" per property data type, but this would fail f=
or
> > > extreme cases like if the property is u32, and if the default value
> used
> > > was INT_MAX, then it breaks when the property could take value
> 0xFFFFFFFF
> > > as valid value.
> > > So the query here was to check if any preference from above options o=
r
> > > hear any new approaches as well.
> > >
> > > The second query was about how to represent this error(per property
> error)
> > > on redfish, our proposal for now is to return "NULL" for any property
> that
> > > might be failing at the backend. Any thoughts on this approach?
> > >
> > > >> I don't have any special insights.  Are you looking to follow a
> design
> > > >> pattern?  Are you looking for direction from the BMCWeb maintainer=
s?
> > >
> > > Yes, we are working on a design pattern proposal and will publish it
> here
> > > for review.
> > > It would be great if we could get some directions/inputs from the
> > > maintainers as well.
> > >
> > > Thanks,
> > > Shakeeb
> > >
> > > On Thu, Aug 3, 2023 at 10:33=E2=80=AFPM Joseph Reynolds <jrey@linux.i=
bm.com>
> > > wrote:
> > >
> > >> On 7/20/23 2:04 AM, chandu chanti wrote:
> > >> > Hi Team, We are planning to handle errors from backend services in
> bmc
> > >> > web. We are considering the following approaches to implement it,
> but
> > >> > we are facing some issues. please provide your inputs. 1 . Using
> > >> > exceptions in our backend D-Bus service
> > >> > ZjQcmQRYFpfptBannerStart
> > >> > This Message Is From an Untrusted Sender
> > >> > You have not previously corresponded with this sender.
> > >> > Report Suspicious
> > >> > <
> > >>
> https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJJyaRL1Nus7N2=
6ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp5Tel83pR4ZZR-wpx=
EYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$
> >
> > >>
> > >> >
> > >> > ZjQcmQRYFpfptBannerEnd
> > >> >
> > >> > Hi Team,
> > >> >
> > >> > We are planning to handle errors from backend services in bmc web.
> We
> > >> > are considering the following approaches to implement it, but we a=
re
> > >> > facing some issues. please provide your inputs.
> > >> >
> > >>
> > >> I didn't see anyone else answer this.  Is your question about how to
> > >> architect or design your D-Bus interfaces?  Is the reference the
> BMCWeb
> > >> merely to provide context as a consumer of these D-Bus services?  I
> > >> assume so.
> > >>
> > >> I don't have any special insights.  Are you looking to follow a desi=
gn
> > >> pattern?  Are you looking for direction from the BMCWeb maintainers?
> > >>
> > >> Joseph
> > >>
> > >> > 1 . Using exceptions in our backend D-Bus service by throwing
> > >> > exceptions in the D-Bus property get handlers. It works fine for t=
he
> > >> > Get property method call. However, when using the Get All method
> call,
> > >> > if one property fails, an error is returned without checking the
> other
> > >> > properties. Is there a way to implement exceptions in GetAll so th=
at
> > >> > even if one property fails, we can still fetch the remaining
> properties.
> > >> >
> > >> > 2. Using default values in D-Bus properties to indicate errors. Is
> > >> > there a reference implementation available for setting default
> values
> > >> > for string and integer data types in bmc web, similar to the
> > >> > implementation of NaN (default value) for the double data type in
> > >> > cable.hpp.
> > >> >
> > >> > 3. Implement associated return code per property on dbus, but this
> > >> > would be very inefficient in terms of double the properties on dbu=
s,
> > >> > something we would like to avoid
> > >> >
> > >> > Thanks
> > >> > Chandrasekhar T.
> > >> >
> > >>
> > >>
>
>
>
>
> --
> Patrick Williams
>

--00000000000069aaaf06044cef8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;I don&#39;t understand the proposal. Is this something=
 contained within bmcweb, or does it affect other repositories? <br>&gt;Doe=
s it also affect sdbusplus, or is it limited to the backend applications? <=
br>&gt;I am unable to interpret your writing in terms of dbus property and/=
or method behaviors.<br><br>yes We require changes in the backend dbus serv=
ice; sdbusplus changes are not required.<br><br>Implementation details for =
the backend dbus service are as follows:<br><br>All dbus properties will us=
e the values mentioned in the table as representations of error values.<br>=
For string data types, we will use the predefined value &quot;BE_ERROR-XXX=
=E2=80=9D to indicate error conditions.<br>For double data types, we will u=
se &quot;nan&quot; to represent error conditions.<br>For all integer data t=
ypes, we will use the corresponding MAX values based on the data type.<br><=
br>&gt;Regarding the content below, is it intended to be presented as a tab=
le? <br>&gt;I&#39;m having trouble understanding what this extensive list o=
f types and values is meant to convey.<br><br>Yes, it&#39;s a table. There =
seems to be an issue with formatting. We have organized all data types in a=
 table.<br>Error represenation Table for different data types<br>| D-Bus Da=
ta Type | Value of the D-Bus Property in case of Error | Property Value as =
seen on Redfish |<br>|-----------------|-----------------------------------=
----------|----------------------------------|<br>| INT16 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | INT_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| UINT16 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| UINT_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| INT32 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | LONG_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| null=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| UINT32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
ULONG_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | null =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |<br>| INT64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | LLONG_MAX =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | null =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |<br>| UINT64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ULLONG_MAX =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| DOUB=
LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| std::numeric_limits&lt;T&gt;::quiet_=
NaN() =C2=A0 =C2=A0 =C2=A0 =C2=A0| null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| STRIN=
G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| BE_ERROR-XXX =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| BOOL =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| uint8_t {0=E2=80=93false, 1=E2=80=93true, others- er=
ror} =C2=A0 =C2=A0| null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 31, 2023=
 at 8:58=E2=80=AFPM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xy=
z">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Thu, Aug 31, 2023 at 05:16:50PM +0530, chandu chanti=
 wrote:<br>
&gt; Hi team,<br>
&gt; <br>
&gt; We have drafted a proposal for=C2=A0 &quot;Using default values in D-B=
us properties<br>
&gt; to indicate errors&quot;=C2=A0 as communicated in previous mail.<br>
&gt; <br>
&gt; Issue with Existing Implementation:<br>
&gt; Error handling is not implemented in the existing bmcweb source. The v=
alues<br>
&gt; fetched from D-Bus are used directly in the Redfish response, except f=
or<br>
&gt; some properties. There was no way to represent error for a given data =
type<br>
&gt; on Redfish.<br>
&gt; <br>
&gt; New Implementation Proposal:<br>
&gt; We plan to handle errors from backend D-Bus services in bmcweb using a=
<br>
&gt; custom data type class. We will implement a helper class to create a n=
ew<br>
&gt; data type called mydatatype_t. An object of this class will be created=
 with<br>
&gt; the D-Bus property value as input. This object will be assigned to the=
 JSON<br>
&gt; response using the assignment operator. This assignment operation will=
<br>
&gt; invoke the to_json function with the mydatatype_t object, where D-Bus<=
br>
&gt; values will be validated based on their data types.<br>
<br>
I don&#39;t understand the proposal.=C2=A0 Is this something contained to b=
mcweb,<br>
or does it affect other repos?=C2=A0 sdbusplus also, or just the backend<br=
>
applications?=C2=A0 I am unable to translate what you&#39;ve written to dbu=
s property<br>
and/or method behaviors.<br>
<br>
&gt; <br>
&gt; Data Types and Default Values:<br>
&gt; The following values will be set on the D-Bus property in case of an e=
rror,<br>
&gt; based on the data type. In Redfish, we will validate these properties.=
 If<br>
&gt; the D-Bus property value matches the error value, we will update the<b=
r>
&gt; property value as null in the Redfish JSON response; otherwise, the<br=
>
&gt; corresponding value on D-Bus will be used.<br>
&gt; <br>
<br>
Is the below intended to be a table?=C2=A0 I can&#39;t figure out what this=
 long<br>
list of types and values is suppose to be.<br>
<br>
&gt; *D-Bus*<br>
&gt; <br>
&gt; *data type*<br>
&gt; <br>
&gt; *Value of the D-Bus Property incase of Error *<br>
&gt; <br>
&gt; *Property value as seen on Redfish *<br>
&gt; <br>
&gt; INT16<br>
&gt; <br>
&gt; INT_MAX<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; UINT16<br>
&gt; <br>
&gt; UINT_MAX<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; INT32<br>
&gt; <br>
&gt; LONG_MAX<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; UINT32<br>
&gt; <br>
&gt; ULONG_MAX<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; INT64<br>
&gt; <br>
&gt; LLONG_MAX<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; UINT64<br>
&gt; <br>
&gt; ULLONG_MAX<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; DOUBLE<br>
&gt; <br>
&gt; std::numeric_limits &lt;<a href=3D"http://en.cppreference.com/w/cpp/ty=
pes/numeric_limits" rel=3D"noreferrer" target=3D"_blank">http://en.cpprefer=
ence.com/w/cpp/types/numeric_limits</a>&gt;<br>
&gt; &lt;T&gt;::quiet_NaN()<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; STRING<br>
&gt; <br>
&gt; BE_ERROR-XXX<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; BOOL<br>
&gt; <br>
&gt; uint8_t<br>
&gt; {0=E2=80=93false , 1=E2=80=93true,<br>
&gt;=C2=A0 =C2=A0others- error}<br>
&gt; <br>
&gt; null<br>
&gt; <br>
&gt; In case of error conditions Redfish will report &quot;null&quot; for a=
 property<br>
&gt; irrespective=C2=A0 of the data type.<br>
&gt; <br>
&gt; For error validation, we will implement a custom class, which will<br>
&gt; facilitate error validation for D-Bus values. In instances of errors, =
a<br>
&gt; null value will be allocated to the JSON response. Example for the uin=
t16_t<br>
&gt; data type.<br>
&gt; <br>
&gt; [image: image.png]<br>
&gt; <br>
&gt; [image: image.png]<br>
&gt; <br>
&gt; For more implementation details please refer the following gerrit link=
, we<br>
&gt; implemented it for redfish URI /redfish/v1/Systems/&lt;str&gt;/Memory/=
&lt;str&gt;/.<br>
&gt; <a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/66368" rel=3D=
"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/bmcweb/=
+/66368</a><br>
&gt; <br>
&gt; Your feedback and insights are greatly appreciated.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Chandrasekhar T.<br>
&gt; <br>
&gt; On Fri, Aug 4, 2023 at 12:37=E2=80=AFPM Shakeeb Pasha &lt;<a href=3D"m=
ailto:shakeebbk@gmail.com" target=3D"_blank">shakeebbk@gmail.com</a>&gt; wr=
ote:<br>
&gt; <br>
&gt; &gt; Thanks Joseph for the response.<br>
&gt; &gt; &gt;&gt; I didn&#39;t see anyone else answer this.=C2=A0 Is your =
question about how to<br>
&gt; &gt; &gt;&gt; architect or design your D-Bus interfaces?=C2=A0 Is the =
reference the BMCWeb<br>
&gt; &gt; &gt;&gt; merely to provide context as a consumer of these D-Bus s=
ervices?=C2=A0 I<br>
&gt; &gt; &gt;&gt; assume so.<br>
&gt; &gt; Question is two pronged, one we wanted to know the best way to<br=
>
&gt; &gt; propagate error from dbus to bmcweb.<br>
&gt; &gt; Options we tried:<br>
&gt; &gt; 1. Have handlers of each property throw an exception if there was=
 an<br>
&gt; &gt; error. But this did not work well with current bmcweb implementat=
ion(get<br>
&gt; &gt; all method call), as it would lead to the entire resource not get=
ting<br>
&gt; &gt; populated even if we have one property failing.<br>
&gt; &gt; 2. Implement one additional associated rc property - and do the e=
rror<br>
&gt; &gt; handling bmcweb by looking at that, but this doubled up the numbe=
r of<br>
&gt; &gt; properties on dbus.<br>
&gt; &gt; 3. Use &quot;default values&quot; per property data type, but thi=
s would fail for<br>
&gt; &gt; extreme cases like if the property is u32, and if the default val=
ue used<br>
&gt; &gt; was INT_MAX, then it breaks when the property could take value 0x=
FFFFFFFF<br>
&gt; &gt; as valid value.<br>
&gt; &gt; So the query here was to check if any preference from above optio=
ns or<br>
&gt; &gt; hear any new approaches as well.<br>
&gt; &gt;<br>
&gt; &gt; The second query was about how to represent this error(per proper=
ty error)<br>
&gt; &gt; on redfish, our proposal for now is to return &quot;NULL&quot; fo=
r any property that<br>
&gt; &gt; might be failing at the backend. Any thoughts on this approach?<b=
r>
&gt; &gt;<br>
&gt; &gt; &gt;&gt; I don&#39;t have any special insights.=C2=A0 Are you loo=
king to follow a design<br>
&gt; &gt; &gt;&gt; pattern?=C2=A0 Are you looking for direction from the BM=
CWeb maintainers?<br>
&gt; &gt;<br>
&gt; &gt; Yes, we are working on a design pattern proposal and will publish=
 it here<br>
&gt; &gt; for review.<br>
&gt; &gt; It would be great if we could get some directions/inputs from the=
<br>
&gt; &gt; maintainers as well.<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Shakeeb<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Aug 3, 2023 at 10:33=E2=80=AFPM Joseph Reynolds &lt;<a hr=
ef=3D"mailto:jrey@linux.ibm.com" target=3D"_blank">jrey@linux.ibm.com</a>&g=
t;<br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On 7/20/23 2:04 AM, chandu chanti wrote:<br>
&gt; &gt;&gt; &gt; Hi Team, We are planning to handle errors from backend s=
ervices in bmc<br>
&gt; &gt;&gt; &gt; web. We are considering the following approaches to impl=
ement it, but<br>
&gt; &gt;&gt; &gt; we are facing some issues. please provide your inputs. 1=
 . Using<br>
&gt; &gt;&gt; &gt; exceptions in our backend D-Bus service<br>
&gt; &gt;&gt; &gt; ZjQcmQRYFpfptBannerStart<br>
&gt; &gt;&gt; &gt; This Message Is From an Untrusted Sender<br>
&gt; &gt;&gt; &gt; You have not previously corresponded with this sender.<b=
r>
&gt; &gt;&gt; &gt; Report Suspicious<br>
&gt; &gt;&gt; &gt; &lt;<br>
&gt; &gt;&gt; <a href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/Pj=
iDSg!12-vrJJyaRL1Nus7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1=
TwX0wxp5Tel83pR4ZZR-wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$" rel=3D"noreferrer" =
target=3D"_blank">https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12=
-vrJJyaRL1Nus7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp=
5Tel83pR4ZZR-wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; ZjQcmQRYFpfptBannerEnd<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Hi Team,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; We are planning to handle errors from backend services i=
n bmc web. We<br>
&gt; &gt;&gt; &gt; are considering the following approaches to implement it=
, but we are<br>
&gt; &gt;&gt; &gt; facing some issues. please provide your inputs.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I didn&#39;t see anyone else answer this.=C2=A0 Is your quest=
ion about how to<br>
&gt; &gt;&gt; architect or design your D-Bus interfaces?=C2=A0 Is the refer=
ence the BMCWeb<br>
&gt; &gt;&gt; merely to provide context as a consumer of these D-Bus servic=
es?=C2=A0 I<br>
&gt; &gt;&gt; assume so.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I don&#39;t have any special insights.=C2=A0 Are you looking =
to follow a design<br>
&gt; &gt;&gt; pattern?=C2=A0 Are you looking for direction from the BMCWeb =
maintainers?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Joseph<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; 1 . Using exceptions in our backend D-Bus service by thr=
owing<br>
&gt; &gt;&gt; &gt; exceptions in the D-Bus property get handlers. It works =
fine for the<br>
&gt; &gt;&gt; &gt; Get property method call. However, when using the Get Al=
l method call,<br>
&gt; &gt;&gt; &gt; if one property fails, an error is returned without chec=
king the other<br>
&gt; &gt;&gt; &gt; properties. Is there a way to implement exceptions in Ge=
tAll so that<br>
&gt; &gt;&gt; &gt; even if one property fails, we can still fetch the remai=
ning properties.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; 2. Using default values in D-Bus properties to indicate =
errors. Is<br>
&gt; &gt;&gt; &gt; there a reference implementation available for setting d=
efault values<br>
&gt; &gt;&gt; &gt; for string and integer data types in bmc web, similar to=
 the<br>
&gt; &gt;&gt; &gt; implementation of NaN (default value) for the double dat=
a type in<br>
&gt; &gt;&gt; &gt; cable.hpp.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; 3. Implement associated return code per property on dbus=
, but this<br>
&gt; &gt;&gt; &gt; would be very inefficient in terms of double the propert=
ies on dbus,<br>
&gt; &gt;&gt; &gt; something we would like to avoid<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Thanks<br>
&gt; &gt;&gt; &gt; Chandrasekhar T.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
<br>
<br>
<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--00000000000069aaaf06044cef8a--
